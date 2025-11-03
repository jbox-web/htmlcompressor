require 'minitest/autorun'
require 'htmlcompressor/compressor'

module HtmlCompressor

  class TestCompressor < Minitest::Test

    private

    def resource_path
      File.join File.expand_path(File.dirname(__FILE__)), 'resources', 'html'
    end

    def read_resource file
      File.read(File.join(resource_path, file)).chomp
    end

  end

end
