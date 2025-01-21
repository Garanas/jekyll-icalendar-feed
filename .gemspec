require_relative "lib/jekyll-icalendar-feed/version"

Gem::Specification.new do |s|
  s.name        = 'jekyll-icalendar-feed'
  s.version     = Jekyll::ICalendarFeed::VERSION
  s.date        = '2024-12-31'
  s.summary     = ''
  s.description = ''
  s.authors     = ['Willem \'Jip\' Wijnia']
  s.files       = Dir["lib/**/*"]
  s.homepage    = 'https://github.com/Garanas/jekyll-icalendar-feed'
  s.license     = 'MIT'

  s.required_ruby_version = ">= 3.0.0"

  s.add_dependency 'jekyll', '> 3.3', '< 5.0'
  s.add_dependency 'icalendar'
end
