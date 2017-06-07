# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "everlasting/version"

Gem::Specification.new do |spec|
  spec.name          = 'everlasting'
  spec.version       = Everlasting::VERSION
  spec.authors       = ['Koichi ITO']
  spec.email         = ['koic.ito@gmail.com']

  spec.summary       = %q{Enhance the behavior of Hash in the behavior of ActionController::Parameters.}
  spec.description   = %q{ActionController::Parameters does not inherit Hash since Rails 5.0. This Gem will never cause an error even if you call Hash's method on ActionController::Parameters.}
  spec.license       = 'MIT'

  spec.authors = ['Koichi ITO']
  spec.email = 'koic.ito@gmail.com'
  spec.homepage = 'http://github.com/koic/everlasting'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2.2'

  spec.add_dependency 'actionpack', '>= 5.0.0'

  spec.add_development_dependency 'rails', '>= 5.0.0'
  spec.add_development_dependency 'rspec-rails', '>= 3.0'
  spec.add_development_dependency 'sqlite3'
end
