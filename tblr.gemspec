# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tblr/version'

Gem::Specification.new do |spec|
  spec.name          = "tblr"
  spec.version       = Tblr::VERSION
  spec.authors       = ["Benjamin Guest"]
  spec.email         = ["benguest@gmail.com"]
  spec.summary       = %q{Little gem to support talbes}
  spec.description   = %q{Initialize a Tblr::Table with headers and rows, do things with the table}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
