$:.push File.expand_path("lib", __dir__)

require 'assets_deployer/version'

Gem::Specification.new do |s|
  s.name        = 'assets_deployer'
  s.version     = AssetsDeployer::VERSION
  s.authors     = ['Shota Iguchi']
  s.email       = ['shota-iguchi@cookpad.com']
  s.summary     = 'Rails assets deployer'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 4.2'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'aws-sdk'
end
