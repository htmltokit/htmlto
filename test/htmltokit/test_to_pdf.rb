# frozen_string_literal: true

require "test_helper"

class HtmlToKit::TestToPDF < ApplicationTest

  it "HtmlToKit#to_pdf - with URL" do
    assert_pdf_generated do
      HtmlToKit.new('https://example.com').to_pdf(pdf_path)
    end
  end

  it "HtmlToKit#to_pdf - with HTML string" do
    assert_pdf_generated do
      HtmlToKit.new('<html><body><h1>Hello World!</h1></body></html>').to_pdf(pdf_path)
    end
  end

  it "HtmlToKit#to_pdf - with HTML file" do
    assert_pdf_generated do
      file = File.new("#{__dir__}/../support/example.html")
      HtmlToKit.new(file).to_pdf(pdf_path)
    end
  end

  private

  def assert_pdf_generated
    FileUtils.mkdir_p tmp_folder_path
    clean_pdf pdf_path
    refute_path_exists pdf_path
    yield
    assert_path_exists pdf_path
  end

  def clean_pdf(path)
    File.delete(path) rescue nil
  end

  def pdf_path
    "#{tmp_folder_path}/example.pdf"
  end

  def tmp_folder_path
    "#{__dir__}/../../tmp"
  end

end
