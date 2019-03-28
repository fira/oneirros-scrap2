# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oneirros/scrap2/version'

Gem::Specification.new do |spec|
  spec.name          = "oneirros-scrap2"
  spec.version       = Oneirros::Scrap2::VERSION
  spec.authors       = ["Fira"]
  spec.email         = ["fira@firanet.fr"]

  spec.summary       = %q{OneiRRos Scrapping Daemon}
  spec.homepage      = "https://github.com/fira/oneirros-scrap2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  
  spec.add_runtime_dependency "nokogiri", "~> 1.10"
  spec.add_runtime_dependency "mongo", "~> 2.6"
  spec.add_runtime_dependency "mechanize", "~> 2.7"
  spec.add_runtime_dependency "rufus-scheduler", "~> 3.5.2" 
  spec.add_runtime_dependency "redis"
  spec.add_runtime_dependency "redis-queue"
end
