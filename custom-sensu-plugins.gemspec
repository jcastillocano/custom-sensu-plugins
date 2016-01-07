lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'

if RUBY_VERSION < '2.0.0'
  require 'custom-sensu-plugins'
else
  require_relative 'lib/custom-sensu-plugins'
end

Gem::Specification.new do |s|
  s.authors                = ['London Intuit DevOps team']
  #s.cert_chain             = ['certs/sensu-plugins.pem']
  s.date                   = Date.today.to_s
  s.description            = 'This plugin provides custom scripts for GPP checks.'
  s.email                  = '<SBG-PDGPP-IT-London@intuit.com>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w(README.md CHANGELOG.md)
  s.homepage               = 'https://github.com/jcastillocano/custom-sensu-plugins'
  s.license                = ''
  s.name                   = 'custom-sensu-plugins'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 1.9.3'
  s.summary                = 'Sensu plugins for various http monitors and metrics'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = CustomSensuPlugins::Version::VER_STRING

  s.add_runtime_dependency 'sensu-plugin', '1.2.0'

  s.add_development_dependency 'bundler',                   '~> 1.7'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  s.add_development_dependency 'github-markup',             '~> 1.3'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 10.0'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rspec',                     '~> 3.1'
  s.add_development_dependency 'rubocop',                   '0.32.1'
  s.add_development_dependency 'yard',                      '~> 0.8'
end
