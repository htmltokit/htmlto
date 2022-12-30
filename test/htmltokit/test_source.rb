# frozen_string_literal: true

require "test_helper"

class HtmlToKit::TestSource < ApplicationTest

  it "#url?" do
    assert HtmlToKit::Source.new('http://www.example.com').url?
    assert HtmlToKit::Source.new('https://www.example.com').url?
    refute HtmlToKit::Source.new('<div>abc</div>').url?
    refute HtmlToKit::Source.new(File.new("#{__dir__}/../support/example.html")).url?
    refute HtmlToKit::Source.new(Tempfile.new).url?
  end

  it "#file?" do
    refute HtmlToKit::Source.new('http://www.example.com').file?
    refute HtmlToKit::Source.new('https://www.example.com').file?
    refute HtmlToKit::Source.new('<div>abc</div>').file?
    assert HtmlToKit::Source.new(File.new("#{__dir__}/../support/example.html")).file?
    assert HtmlToKit::Source.new(Tempfile.new).file?
  end

  it "#html?" do
    refute HtmlToKit::Source.new('http://www.example.com').html?
    refute HtmlToKit::Source.new('https://www.example.com').html?
    assert HtmlToKit::Source.new('<div>abc</div>').html?
    refute HtmlToKit::Source.new(File.new("#{__dir__}/../support/example.html")).html?
    refute HtmlToKit::Source.new(Tempfile.new).html?
  end

  it "#url" do
    assert_equal 'http://www.example.com', HtmlToKit::Source.new('http://www.example.com').url
    assert_equal 'https://www.example.com', HtmlToKit::Source.new('https://www.example.com').url

    assert_raises HtmlToKit::Source::InvalidURL do
      HtmlToKit::Source.new('<div>abc</div>').url
    end

    assert_raises HtmlToKit::Source::InvalidURL do
      HtmlToKit::Source.new(File.new("#{__dir__}/../support/example.html")).url
    end

    assert_raises HtmlToKit::Source::InvalidURL do
      HtmlToKit::Source.new(Tempfile.new).url
    end
  end

  it "#html" do
    assert_raises HtmlToKit::Source::InvalidHTML do
      HtmlToKit::Source.new('http://www.example.com').html
    end

    assert_raises HtmlToKit::Source::InvalidHTML do
      HtmlToKit::Source.new('https://www.example.com').html
    end

    assert_equal '<div>abc</div>', HtmlToKit::Source.new('<div>abc</div>').html

    assert_includes HtmlToKit::Source.new(File.new("#{__dir__}/../support/example.html")).html, '<h1>Example</h1>'

    tempfile = Tempfile.new
    tempfile.write('<div>abc</div>')
    tempfile.rewind
    assert_equal '<div>abc</div>', HtmlToKit::Source.new(tempfile).html
  end

end
