# frozen_string_literal: true

require 'rack'

module HtmlCompressor
  require_relative 'html_compressor/version'
  require_relative 'html_compressor/errors'
  require_relative 'html_compressor/compressor'
  require_relative 'html_compressor/rack'
end
