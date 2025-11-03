# frozen_string_literal: true

require_relative 'lib/htmlcompressor/version'

Gem::Specification.new do |s|
  s.name     = 'htmlcompressor'
  s.version  = HtmlCompressor::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ['Paolo Chiodi']
  s.email    = ['chiodi84@gmail.com']
  s.homepage = 'https://github.com/paolochiodi/htmlcompressor'
  s.summary  = 'htmlcompressor provides a class and a rack middleware to minify html pages'
  s.license  = 'Apache 2.0'

  s.required_ruby_version = '>= 3.2.0'

  s.files = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*.rb']
end
