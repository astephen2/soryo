# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |spec|
  spec.name          = "soryo"
  spec.version       = "0.0.0"
  spec.authors       = ["Alex Stephen"]
  spec.email         = ["stepa@umich.edu"]
  spec.description   = %q{Let's build all the emails!}
  spec.summary       = %q{EMAILS! EMAILS! EMAILS!}
  spec.homepage      = "http://www.soryorb.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
