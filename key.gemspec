# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'key/version'

Gem::Specification.new do |spec|
  spec.name          = "key"
  spec.version       = Key::VERSION
  spec.authors       = ["Ariejan de Vroom"]
  spec.email         = ["ariejan@ariejan.net"]
  spec.summary       = %q{A command line utility to simplify your GPG life.}
  spec.description   = <<-EOS
Key is a intuitive command line utility that makes your life with GPG easier. 
It makes using GPG much easier by creating sensible commands and shortcuts. 
EOS
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "gpgme", "~> 2.0.0"
  spec.add_dependency "thor", "~> 0.19.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "rspec"
end
