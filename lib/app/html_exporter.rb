require "builder"

class HTMLExporter
  attr_reader :images

  def initialize(imgs)
    @images = imgs
  end

  def save(file_path)
    xm = Builder::XmlMarkup.new(:indent => 2)

    xm.table do
      header =  ["Name", "Latitude", "Longitude"]
      xm.tr { header.each { |value| xm.th(value) } }
      images.each { |row| xm.tr { row.values.each { |value| xm.td(value)}}}
    end

    write_table(xm, file_path)
  end

  def write_table(xm, file_path)
    begin
      file = File.open(file_path, "w")
      file.write(xm) 
    ensure
      file.close unless file.nil?
    end
  end
end
