# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name = "votesmart"
  s.version = "0.4.3"
  s.platform = Gem::Platform::RUBY

  s.authors = ["Dan Cunning", "Ben Woosley", "Mark J Steckel", "Ben Atkins"]
  s.date = "2014-09-20"
  s.description = "A wrapper for the Project Vote Smart API"
  s.email = "ben.woosley@gmail.com"
  s.homepage = "https://github.com/batter/votesmart"
  s.require_paths = ["lib"]
  s.summary = "A wrapper for the Project Vote Smart API"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.extra_rdoc_files = [
    "README.rdoc"
  ]

  s.required_rubygems_version = '>= 1.3.6'

  s.add_dependency 'patron', '~> 0.6.0'

  s.add_development_dependency 'rake', '~> 10.1.1'
  s.add_development_dependency 'rspec', '< 2'
  s.add_development_dependency 'ym4r'
  s.add_development_dependency 'mcll4r'
end

