require "exif"
require "csv"

class ImageExtractor
  def self.gps_from_exif(image)
    data = Exif::Data.new(File.open(image))
    {
      name: image_name(image),
      lat: data.gps_latitude,
      lon: data.gps_longitude
    }
  end

  def self.image_name(image)
    File.basename(image, ".*")
  end
end