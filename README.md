# About this gem

This command line application recursively reads all of the images from the supplied directory of images (`images/gps/`), extracts their EXIF GPS data (longitude and latitude), and then writes the name of that image and any GPS co-ordinates it finds to a CSV file. A HTML file generation is also available.

Both CSV and HTML files are stored in the `output/` folder.

This app was created using [Thor](http://whatisthor.com/).Thor is a very robust toolkit for creating command line interfaces and I thought this could be the perfect opportunity to use it. At my previous company, we used Thor to create a CLI for orchestrating our Kubernetes clusters. It's easy to expand it and really fun to use.

The dependencies for this app are [Exif](https://github.com/tonytonyjan/exif), the fastest Ruby EXIF reader,  and [Builder](https://github.com/jimweirich/builder), a simple way to create XML markup and data structures.

## Installation

This gem has not been released, so in order to run it locally, please run:

`bin/setup` to install dependencies;
`rake test` to run the tests;

Now, to install this gem onto your local machine, run `bundle exec rake install`.

<!-- Make the script executable:

`chmod a+x app.rb` -->

The ruby version is `2.6.1`.

## Usage

This gem is a CLI that allows the user to pass two optional fields: a directory with jpg images to be extracted their exif gps data and what type of file the info will be written, CSV or HTML.

With no parameters, it scanns from the current directory and generates an CSV file with the Exif data, if any.

The latitude and longitude values are in the Exif format. EXIF stores GPS coords as rational64u that can be read like:

`[(50/1), (137/25), (0/1)]` => `Lat: 50° 137.25' 0"`
`[(122/1), (2837/50), (0/1)]</td>` => `Lng:  122° 2837.50' 0"`

### How to call it

In this directory, we have available a folder called `gps_images` with some jpg images in it. If you want to read that, you can run:

`bundle exec exe/app init`

that will scan the current directory and outpus a CSV file.

### Optional parameters

The app can be used by running `app init -d gps_images -o html`

`-d` - alias for optional directory
`-o` - alias for optional output type