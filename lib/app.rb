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

    desc "export", "exports images gps exif data from a directory into a CSV file"
    option :directory, :type => :string, :aliases => "-d", :default => "."
    option :output_type, :type => :string, :aliases => "-o", :default => "csv"
    def export
      Dir.mkdir "output/" unless File.exist? "output/"

      output_type = options[:output_type] if options
      directory = options[:directory] if options

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
        raise Exception.new e.message
      end
    end
  end
end

def validate!(directory, output_type)
  raise Exception.new "path #{directory} is not a valid directory, try running 'app help init'" unless Dir.exist?(directory)

  supported_types = %w(csv html)
  raise Exception.new "output #{output_type} not supported, please use 'csv' or 'html' or try running 'app help init'" unless supported_types.include?(output_type)
end

def create_file(images, output_type)
  if output_type == "csv"
    CSVExporter.new(images).save("output/images.csv")
  elsif output_type == "html"
    HTMLExporter.new(images).save("output/images.html")
  end
end
