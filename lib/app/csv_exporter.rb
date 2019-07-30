require "csv"

class CSVExporter
  attr_reader :images

  def initialize(imgs)
    @images = imgs
  end

  def save(file_path)
    CSV.open(file_path, "wb", :headers => true) do |csv|
      csv << ["Name", "Latitude", "Longitude"]
      images.each do |image|
        csv << [image[:name], image[:lat], image[:lon]]
      end
    end
  end
end