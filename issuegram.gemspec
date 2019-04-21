# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path('lib', __dir__))
require 'issuegram/version'

Gem::Specification.new do |spec|
  spec.name          = 'issuegram'
  spec.version       = Issuegram::VERSION
  spec.authors       = ['hezbymuhammad']
  spec.email         = ['hezbymuhammad@gmail.com']
  spec.summary       = 'Github Issue Graph Generator'
  spec.homepage      = 'https://github.com/hezbymuhammad/issuegram'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split('\n')
  spec.executables   = ['issuegram']
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'zeitwerk', '~> 2.1.2'

  spec.add_development_dependency 'bundler', "~> 2.0.1"
end
