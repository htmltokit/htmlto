# frozen_string_literal: true

require "test_helper"

class HtmlToKit::TestToImage < ApplicationTest

  it "HtmlToKit#to_image - with URL" do
    assert_image_generated(:png) do |image_path|
      HtmlToKit.new('https://example.com').to_image(image_path)
    end

    assert_image_generated(:jpg) do |image_path|
      HtmlToKit.new('https://example.com').to_image(image_path)
    end
  end

  it "HtmlToKit#to_image - with HTML string" do
    assert_image_generated(:png) do |image_path|
      HtmlToKit.new('<html><body><h1>Hello World!</h1></body></html>').to_image(image_path)
    end

    assert_image_generated(:jpg) do |image_path|
      HtmlToKit.new('<html><body><h1>Hello World!</h1></body></html>').to_image(image_path)
    end
  end

  it "HtmlToKit#to_image - with HTML file" do
    assert_image_generated(:png) do |image_path|
      file = File.new("#{__dir__}/../support/example.html")
      HtmlToKit.new(file).to_image(image_path)
    end

    assert_image_generated(:jpg) do |image_path|
      file = File.new("#{__dir__}/../support/example.html")
      HtmlToKit.new(file).to_image(image_path)
    end
  end

  it "HtmlToKit#to_image - only support PNG and JPEG" do
    refute_image_generated(:gif) do |image_path|
      error = assert_raises RuntimeError do
        HtmlToKit.new('<html><body><h1>Hello World!</h1></body></html>').to_image(image_path)
      end
      assert_equal "Not supported options `:format` gif. jpeg | png", error.message
    end
  end

  private

  def assert_image_generated(format)
    FileUtils.mkdir_p tmp_folder_path
    image_path = buidl_image_path(format)
    clean_image image_path
    refute_path_exists image_path
    yield image_path
    assert_path_exists image_path
  end

  def refute_image_generated(format)
    FileUtils.mkdir_p tmp_folder_path
    image_path = buidl_image_path(format)
    clean_image image_path
    refute_path_exists image_path
    yield image_path
    refute_path_exists image_path
  end

  def clean_image(path)
    File.delete(path) rescue nil
  end

  def buidl_image_path(extension)
    "#{tmp_folder_path}/example.#{extension}"
  end

  def tmp_folder_path
    "#{__dir__}/../../tmp"
  end

end
