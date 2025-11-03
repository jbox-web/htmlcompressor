# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'HtmlCompressor::Javascript::Yui' do
  it 'compress_java_script_yui' do
    source = read_resource('testCompressJavaScript.html')
    result = read_resource('testCompressJavaScriptYuiResult.html')

    compressor = HtmlCompressor::Compressor.new(
      compress_javascript: true,
      javascript_compressor: :yui,
      remove_intertag_spaces: true,
      compress_js_templates: true
    )

    expect(compressor.compress(source)).to eq result
  end

  it 'compress_css' do
    source = read_resource('testCompressCss.html')
    result = read_resource('testCompressCssResult.html')

    compressor = HtmlCompressor::Compressor.new(
      compress_css: true,
      css_compressor: :yui,
      remove_intertag_spaces: true
    )

    expect(compressor.compress(source)).to eq result
  end
end
