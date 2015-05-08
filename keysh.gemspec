# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'keysh/version'

Gem::Specification.new do |spec|
  spec.name          = "keysh"
  spec.version       = Keysh::VERSION
  spec.authors       = ["devend711"]
  spec.email         = ["devend711@gmail.com"]
  spec.summary       = %q{Manage SSH keys and identities with ease}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["keysh"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "thor", "~> 0.19.1"
end
