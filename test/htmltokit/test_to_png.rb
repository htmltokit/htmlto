# frozen_string_literal: true

require "test_helper"

class HtmlToKit::TestToPNG < ApplicationTest

  it "HtmlToKit#to_png - with URL" do
    assert_example_png_generated do
      HtmlToKit.new('https://example.com').to_png(exampe_png_path)
    end
  end

  it "HtmlToKit#to_png - with HTML string" do
    assert_example_png_generated do
      HtmlToKit.new('<html><body><h1>Hello World!</h1></body></html>').to_png(exampe_png_path)
    end
  end

  it "HtmlToKit#to_png - with HTML file" do
    assert_example_png_generated do
      file = File.new("#{__dir__}/../support/example.html")
      HtmlToKit.new(file).to_png(exampe_png_path)
    end
  end

  private

  def assert_example_png_generated
    FileUtils.mkdir_p tmp_folder_path
    clean_example_png
    refute_path_exists exampe_png_path
    yield
    assert_path_exists exampe_png_path
  end

  def clean_example_png
    File.delete(exampe_png_path) rescue nil
  end

  def exampe_png_path
    "#{tmp_folder_path}/example.png"
  end

  def tmp_folder_path
    "#{__dir__}/../../tmp"
  end

end
