# -*- encoding: utf-8 -*-

require File.expand_path('../lib/htmlcompressor/version', __FILE__)

Gem::Specification.new do |s|
  s.name     = 'htmlcompressor'
  s.version  = HtmlCompressor::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ['Paolo Chiodi']
  s.email    = ['chiodi84@gmail.com']
  s.homepage = 'https://github.com/paolochiodi/htmlcompressor'
  s.summary  = 'htmlcompressor provides a class and a rack middleware to minify html pages'
  s.license  = 'Apache 2.0'

  s.files = Dir['README.md', 'CHANGELOG', 'LICENSE', 'lib/**/*.rb']

  s.add_development_dependency 'yui-compressor', '~> 0.9'
  s.add_development_dependency 'closure-compiler', '~> 1.1'
  s.add_development_dependency 'rake', '~> 10.3.2'
  s.add_development_dependency 'minitest', '~> 5.0'
end
