# About this gem

This command line application recursively reads all of the images from the supplied directory of images (`images/gps/`), extracts their EXIF GPS data (longitude and latitude), and then writes the name of that image and any GPS co-ordinates it finds to a CSV file.

It allows the user to pass two optional fields: a directory and what type of file the info will be written, CSV or HTML.

This app was created using [Thor](http://whatisthor.com/).Thor is a very robust toolkit for creating command line interfaces and I thought this could be the perfect opportunity to use it. At my previous company, we used Thor to create a CLI for orchestrating our Kubernetes clusters. It's easy to expand it and really fun to use.

The dependencies for this app are [Exif](https://github.com/tonytonyjan/exif), the fastest Ruby EXIF reader,  and [Builder](https://github.com/jimweirich/builder), a simple way to create XML markup and data structures.

## Installation

This gem has not been released, so in order to run it locally, follow these steps:

1 - `git clone git@github.com:stefannibrasil/lendesk.git`
2 - `bin/setup` to install dependencies.
3 - `rake install` to install this gem onto your local machine.

## Usage

`app init`

Running the command above will scan the current directory (folder `gps_images/`) and generates an CSV file with the Exif data.

This command can also be run with two optional flags:

`-d` - alias for optional `directory`
`-o` - alias for optional `output_type`

To run the command with the aliases, run:

`app init -d your_directory -o html`

### Output

Both CSV and HTML files are stored in the `output/` folder.

The latitude and longitude output values are in the EXIF format. EXIF stores GPS coords as rational64u that can be read like:

`[(50/1), (137/25), (0/1)]` => `Lat: 50° 137.25' 0"`

`[(122/1), (2837/50), (0/1)]</td>` => `Lng:  122° 2837.50' 0"`

### Tests

`rake test` run the tests.
