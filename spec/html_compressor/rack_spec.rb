# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HtmlCompressor::Rack do
  it 'compresses body' do
    app = ->(_env) { [200, { 'content-type' => 'text/html; charset=utf-8' }, ['<html><body><div>foo</div></body></html>']] }
    rack = described_class.new(app)
    expect { # rubocop:disable Style/BlockDelimiters
      rack.call({})
    }.to_not raise_error
  end
end
