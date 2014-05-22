
Gem::Specification.new do |s|
  s.name          = 'yard-wires'
  s.version       = '0.0.1'
  s.date          = '2014-05-21'
  s.summary       = 'yard-wires'
  s.description   = "YARD plugin for documenting programs using the wires"\
                    " event routing framework for Ruby."
  s.authors       = ["Joe McIlvain"]
  s.email         = 'joe.eli.mac@gmail.com'
  
  s.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  
  s.require_path  = 'lib'
  s.homepage      = 'https://github.com/jemc/yard-wires/'
  s.licenses      = "Copyright 2013-2014 Joe McIlvain. All rights reserved."
  
  s.add_dependency 'yard'
  
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-rescue'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fivemat'
  s.add_development_dependency 'yard'
end
