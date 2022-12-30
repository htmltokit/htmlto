# frozen_string_literal: true

require_relative "htmltokit/version"
require 'ferrum'
require 'active_method'
require_relative "htmltokit/source"
require_relative "htmltokit/to_png"

class HtmlToKit
  include ActiveMethod

  class Error < StandardError; end

  attr_reader :source

  def initialize(url_file_or_html)
    @source = Source.new(url_file_or_html)
  end

  active_method :to_png, ToPNG
end
