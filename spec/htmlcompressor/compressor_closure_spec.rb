# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'HtmlCompressor::Javascript' do
  it 'compress_java_script_closure' do
    source = read_resource('testCompressJavaScript.html')
    result = read_resource('testCompressJavaScriptClosureResult.html')

    compressor = HtmlCompressor::Compressor.new(
      compress_javascript: true,
      javascript_compressor: :closure,
      remove_intertag_spaces: true,
      compress_js_templates: true
    )

    expect(compressor.compress(source)).to eq result
  end
end
