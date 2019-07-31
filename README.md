# About this gem

This command line application recursively reads all of the images from the supplied directory of images (`gps_images/`), extracts their EXIF GPS data (longitude and latitude), and then writes the name of that image and any GPS co-ordinates it finds to a CSV file.

It allows the user to pass two optional fields: a directory and what type of file the info will be written, CSV or HTML.

This app was created using [Thor](http://whatisthor.com/).Thor is a very robust toolkit for creating command line interfaces and I thought this could be the perfect opportunity to use it. At my previous company, we used Thor to create a CLI for orchestrating our Kubernetes clusters. It's easy to expand it and really fun to use.

The dependencies for this app are [Exif](https://github.com/tonytonyjan/exif), the fastest Ruby EXIF reader,  and [Builder](https://github.com/jimweirich/builder), a simple way to create XML markup and data structures.

## Installation

This project depends on [libexif](https://libexif.github.io). If you're on a mac, run `brew install libexif` to install it.

This project assumes you have a ruby environment setup in your machine, like having a ruby version and Bundler installed. If that's the case, you can skip these 3 first commands.

To install ruby and Bundler, please run these steps:

- [install ruby](https://github.com/asdf-vm/asdf-ruby), setting the version to `2.6.1`

- install [Bundler](https://bundler.io/) running `gem install bundler`

- run `bundle install`

This gem has not been released, so in order to run it locally, follow these steps:

1 - `git clone git@github.com:stefannibrasil/lendesk.git`

2 - `cd lendesk && bin/setup` to install dependencies.

3 - `rake install` to install this gem onto your local machine.

## Usage

`app export`

Running the command above will scan the default directory (folder `gps_images/`) and generates an CSV file with the Exif data.

This command can also be run with two optional flags:

`-d` - alias for optional `directory`, where the app will get the images

`-o` - alias for optional `output_type`, which can be `csv` or `html`

To export the exif data from all images in folder `gps_images` as `html`, run:

`app export -d gps_images -o html`

To export as `csv`, run:

`app export -d gps_images -o csv`

Both these commands will save the output on folder `/output/`. To see the output files, run `cat output/*.*`.

**Tip**: `app help export` provides a full description of the `export` task, including its optional parameters.

**Tips[1]**: try running `thor` for seeing all features of Thor.

### Output

The latitude and longitude output values are in the EXIF format. EXIF stores GPS coords as rational64u that can be read like:

`[(50/1), (137/25), (0/1)]` => `Lat: 50° 137.25' 0"`

`[(122/1), (2837/50), (0/1)]</td>` => `Lng:  122° 2837.50' 0"`

## Tests

run `rake test`

## Todo

- Add more tests
- Convert gps degrees into coordinates
- Use Design Patterns for having a more reusable code
