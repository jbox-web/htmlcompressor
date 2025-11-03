# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HtmlCompressor::Compressor do
  it 'enabled' do
    source = read_resource('testEnabled.html')
    result = read_resource('testEnabledResult.html')

    compressor = described_class.new(enabled: false)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_spaces_inside_tags' do
    source = read_resource('testRemoveSpacesInsideTags.html')
    result = read_resource('testRemoveSpacesInsideTagsResult.html')

    compressor = described_class.new(remove_multi_spaces: false)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_spaces_inside_tags_disabled' do
    source = read_resource('testRemoveSpacesInsideTags.html')
    result = read_resource('testRemoveSpacesInsideTagsDisabledResult.html')

    compressor = described_class.new(remove_multi_spaces: false, remove_spaces_inside_tags: false)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_comments' do
    source = read_resource('testRemoveComments.html')
    result = read_resource('testRemoveCommentsResult.html')

    compressor = described_class.new(remove_comments: true, remove_intertag_spaces: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_quotes' do
    source = read_resource('testRemoveQuotes.html')
    result = read_resource('testRemoveQuotesResult.html')

    compressor = described_class.new(remove_quotes: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_multi_spaces' do
    source = read_resource('testRemoveMultiSpaces.html')
    result = read_resource('testRemoveMultiSpacesResult.html')

    compressor = described_class.new(remove_multi_spaces: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_intertag_spaces' do
    source = read_resource('testRemoveIntertagSpaces.html')
    result = read_resource('testRemoveIntertagSpacesResult.html')

    compressor = described_class.new(remove_intertag_spaces: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'preserve_patterns' do
    source = read_resource('testPreservePatterns.html')
    result = read_resource('testPreservePatternsResult.html')

    preservePatterns = [
      HtmlCompressor::Compressor::PHP_TAG_PATTERN,                      # <?php ... ?> blocks
      HtmlCompressor::Compressor::SERVER_SCRIPT_TAG_PATTERN,            # <% ... %> blocks
      HtmlCompressor::Compressor::SERVER_SIDE_INCLUDE_PATTERN,          # <!--# ... --> blocks
      Regexp.new('<jsp:.*?>', Regexp::MULTILINE | Regexp::IGNORECASE), # <jsp: ... > tags
    ]

    compressor = described_class.new(
      preserve_patterns: preservePatterns,
      remove_comments: true,
      remove_intertag_spaces: true
    )

    expect(compressor.compress(source)).to eq result
  end

  it 'compress' do
    source = read_resource('testCompress.html')
    result = read_resource('testCompressResult.html')

    compressor = described_class.new(compress_js_templates: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'simple_doctype' do
    source = read_resource('testSimpleDoctype.html')
    result = read_resource('testSimpleDoctypeResult.html')

    compressor = described_class.new(simple_doctype: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_script_attributes' do
    source = read_resource('testRemoveScriptAttributes.html')
    result = read_resource('testRemoveScriptAttributesResult.html')

    compressor = described_class.new(remove_script_attributes: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_style_attributes' do
    source = read_resource('testRemoveStyleAttributes.html')
    result = read_resource('testRemoveStyleAttributesResult.html')

    compressor = described_class.new(remove_style_attributes: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_link_attributes' do
    source = read_resource('testRemoveLinkAttributes.html')
    result = read_resource('testRemoveLinkAttributesResult.html')

    compressor = described_class.new(remove_link_attributes: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_form_attributes' do
    source = read_resource('testRemoveFormAttributes.html')
    result = read_resource('testRemoveFormAttributesResult.html')

    compressor = described_class.new(remove_form_attributes: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_input_attributes' do
    source = read_resource('testRemoveInputAttributes.html')
    result = read_resource('testRemoveInputAttributesResult.html')

    compressor = described_class.new(remove_input_attributes: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_javascript_protocol' do
    source = read_resource('testRemoveJavaScriptProtocol.html')
    result = read_resource('testRemoveJavaScriptProtocolResult.html')

    compressor = described_class.new(remove_javascript_protocol: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_http_protocol' do
    source = read_resource('testRemoveHttpProtocol.html')
    result = read_resource('testRemoveHttpProtocolResult.html')

    compressor = described_class.new(remove_http_protocol: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_https_protocol' do
    source = read_resource('testRemoveHttpsProtocol.html')
    result = read_resource('testRemoveHttpsProtocolResult.html')

    compressor = described_class.new(remove_https_protocol: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'preserve_line_breaks' do
    source = read_resource('testPreserveLineBreaks.html')
    result = read_resource('testPreserveLineBreaksResult.html')

    compressor = described_class.new(preserve_line_breaks: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'remove_surrounding_spaces' do
    source = read_resource('testSurroundingSpaces.html')
    result = read_resource('testSurroundingSpacesResult.html')

    compressor = described_class.new(
      remove_intertag_spaces: true,
      remove_surrounding_spaces: 'p,br'
    )

    expect(compressor.compress(source)).to eq result
  end

  it 'simple_boolean_attributes' do
    source = read_resource('testSimpleBooleanAttributes.html')
    result = read_resource('testSimpleBooleanAttributesResult.html')

    compressor = described_class.new(simple_boolean_attributes: true)

    expect(compressor.compress(source)).to eq result
  end

  it 'preserve_textarea' do
    source = read_resource('testPreserveTextareas.html')
    result = read_resource('testPreserveTextareasResult.html')

    compressor = described_class.new

    expect(compressor.compress(source)).to eq result
  end

  it 'compress_custom_html_templates' do
    source = read_resource('testCompressCustomHtmlTemplates.html')
    result = read_resource('testCompressCustomHtmlTemplatesResult.html')
    compressor = described_class.new(compress_js_templates: ['text/html'], remove_quotes: true)
    expect(compressor.compress(source)).to eq result
  end

  it 'dont_replace_javascript_inside_js_templates' do
    source = read_resource('testCompressCustomHtmlTemplates.html')
    result = read_resource('testCompressCustomHtmlTemplates.html')
    compressor = described_class.new(compress_js_templates: false, remove_quotes: true)
    expect(compressor.compress(source)).to eq result
  end

  it 'javascript_compressor_not_found' do
    source = read_resource('testCompressJavaScript.html')

    compressor = described_class.new(
      compress_javascript: true,
      javascript_compressor: :not_existing_compressor,
      remove_intertag_spaces: true,
      compress_js_templates: true
    )

    expect_message = 'JavaScript Compressor "not_existing_compressor" not found, please check :javascript_compressor option'

    expect do
      compressor.compress(source)
    end.to raise_error(HtmlCompressor::NotFoundCompressorError).with_message(expect_message)
  end

  it 'css_compressor_not_found' do
    source = read_resource('testCompressCss.html')

    compressor = described_class.new(
      enabled: true,
      compress_css: true,
      css_compressor: :not_existing_compressor,
      compress_javascript: false
    )

    expect_message = 'CSS Compressor "not_existing_compressor" not found, please check :css_compressor option'

    expect do
      compressor.compress(source)
    end.to raise_error(HtmlCompressor::NotFoundCompressorError).with_message(expect_message)
  end
end
