lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "app/version"

Gem::Specification.new do |spec|
  spec.name          = "app"
  spec.version       = App::VERSION
  spec.authors       = ["Stefanni Brasil"]
  spec.email         = ["stefannibrasil@gmail.com"]
  spec.summary       = "App created for Lendesk technical test"
  spec.license       = "MIT"

  spec.files         = Dir['**/*']
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "exif", "~> 2.2.0"
  spec.add_dependency "builder", "~> 3.2.3"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end