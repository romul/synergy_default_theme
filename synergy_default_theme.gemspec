# encoding: utf-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'synergy_default_theme'
  s.version     = '1.0.2'
  s.summary     = 'Default theme for Synergy'
  s.description = 'Тема по умолчанию для платформы электронной коммерции Synergy, основанной на Spree'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Service & Consulting'
  s.email             = 'r.smirnov@secoint.ru'
  s.homepage          = 'https://github.com/romul/synergy_default_theme/'
  # s.rubyforge_project = 'actionmailer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'


  s.add_dependency('synergy')
  s.add_dependency('dalli', '~> 1.0.3')

end
