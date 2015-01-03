# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/extension/mtg/version'

Gem::Specification.new do |spec|
  spec.name          = "cinch-extension-mtg"
  spec.version       = Cinch::Extension::Mtg::VERSION
  spec.authors       = ["Ilkka Hakkarainen"]
  spec.email         = ["ilkka.hakkarainen@cs.helsinki.fi"]
  spec.summary       = %q(Cinch plugin that fetches MtG card information)
  spec.description   = %q(Cinch plugin that fetches MtG card information)
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'cinch'
end
