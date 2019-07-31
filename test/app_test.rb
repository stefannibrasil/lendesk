require "test_helper"

class AppTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::App::VERSION
  end

  def test_it_runs_without_arguments
    out = capture_io do
      App::CLI.new.invoke(:export)
    end

    assert_equal ["./gps_images/image_b.jpg --- File not readable or no EXIF data in file.\ncsv file generated!\n", ""], out
  end

  def test_raise_exception_if_directory_does_not_exist
    invalid_directory = "invalid_folder"

    args = ["export"]
    opts = { :directory => invalid_directory }
    script = App::CLI.new(args, opts)

    exception = assert_raises Exception do
      script.invoke_all
    end
  end

  def test_raise_exception_if_output_type_is_not_valid
    invalid_output = "xml"

    args = ["export"]
    opts = { :output_type => invalid_output }
    script = App::CLI.new(args, opts)

    exception = assert_raises Exception do
      script.invoke_all
    end
  end

  def test_creates_files_in_output_folder
    App::CLI.new.invoke(:export)
    assert_equal File.exist?("output/images.csv"), true
  end
end
