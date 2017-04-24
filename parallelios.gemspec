# frozen_string_literal: true

require './lib/parallelios/version'

Gem::Specification.new do |s|
  s.name          = 'parallelios'
  s.version       = Parallelios::VERSION::STRING
  s.authors       = %w(Vladislav\ Petrov)
  s.email         = %w(electronicchest@gmail.com)
  s.summary       = 'A command line tool for run iOS test parallel in many devices on one machine'
  s.description   = 'A command line tool for run iOS test parallel in many devices on one machine'
  s.homepage      = 'https://github.com/plus3x/parallelios'
  s.license       = 'MIT'

  s.files         = `git ls-files -zx '^(test|spec|features)/'`.split("\x0")
  s.test_files    = `git ls-files -- {test,spec,features}`.split
  s.executables   = `git ls-files -- bin`.split.map { |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.required_ruby_version = '>= 2.2.0'
end
