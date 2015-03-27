# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-myecp/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-myecp"
  spec.version       = OmniAuth::Myecp::VERSION
  spec.authors       = ["Paul dG"]
  spec.email         = ["kiwi+omniauth+myecp@via.ecp.fr"]
  spec.summary       = 'A Omniauth Strategy to use MyECP-OAuth2'
  spec.homepage      = "https://github.com/VIACentraleReseaux/omniauth-myecp"
  spec.license       = "WTFPLv2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "omniauth-oauth2", "~> 1.1.1"
end
