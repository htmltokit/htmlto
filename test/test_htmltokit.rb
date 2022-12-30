# frozen_string_literal: true

require "test_helper"

class TestHtmlToKit < ApplicationTest

  it "it has a version number" do
    refute_nil ::HtmlToKit::VERSION
  end

  it "#source" do
    html_to_kit = HtmlToKit.new('https://www.example.com')
    source = html_to_kit.source
    assert source.is_a?(HtmlToKit::Source)
    assert_equal 'https://www.example.com', source.url
  end

end
