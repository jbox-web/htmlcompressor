# frozen_string_literal: true

module HtmlCompressor
  class Error < StandardError; end
  class MissingCompressorError < Error; end
  class NotFoundCompressorError < Error; end
end
