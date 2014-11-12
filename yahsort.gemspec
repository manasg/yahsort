# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yahsort/version'

Gem::Specification.new do |spec|
  spec.name          = "yahsort"
  spec.version       = Yahsort::VERSION
  spec.authors       = ["Manas Gupta"]
  spec.email         = ["manas.gupta@gmail.com"]
  spec.summary       = %q{Human sorting for hostnames}
  spec.description   = %q{Lambda function to pass into sort}
  spec.homepage      = "https://github.com/manasg"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.1"
end
