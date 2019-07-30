require "app/version"
require "app/image_extractor"
require "app/csv_exporter"
require "app/html_exporter"
require "thor"

module App
  class Error < StandardError; end

  class CLI < Thor
    check_unknown_options!
    package_name "App"

    def self.exit_on_failure?
      true
    end

    # how to run: app init --directory gps_images --output_type  html     
    desc "init", "a task that writes images gps exif data into a CSV or HTML file"
    option :directory, :type => :string, :aliases => "-d", :default => "."
    option :output_type, :type => :string, :aliases => "-o", :default => "csv"
    def init
      Dir.mkdir "output/" unless File.exist? "output/"

      output_type = options[:output_type]
      directory = options[:directory]

      images_with_gps = []
      begin
        validate!(directory, output_type)
        images = Dir.glob("#{directory}/**/*.jpg")
        images.each do |image|
          begin
            images_with_gps << ImageExtractor.gps_from_exif(image)
          rescue StandardError => e
            say "#{image} --- #{e.message}", :yellow
            next
          end
        end
        create_file(images_with_gps, output_type)
        say "#{output_type} file generated!", :green
      rescue StandardError => e
        say "#{e.message}", :red
      end
    end
  end
end

def validate!(directory, output_type)
  raise "path #{directory} is not a valid directory, try running 'app help init'" unless Dir.exist?(directory)

  supported_types = %w(csv html)
  raise "output #{output_type} not supported, please use 'csv' or 'html' or try running 'app help init'" unless supported_types.include?(output_type)
end

def create_file(images, output_type)
  if output_type == "csv"
    CSVExporter.new(images).save("output/images.csv")
  elsif output_type == "html"
    HTMLExporter.new(images).save("output/images.html")
  end
end
