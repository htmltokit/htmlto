class HtmlToKit
  class Source

    class InvalidURL < StandardError; end
    class InvalidHTML < StandardError; end

    def initialize(url_file_or_html)
      @value = url_file_or_html
    end

    def url?
      @is_url ||= @value.is_a?(String) && @value.match?(/\Ahttp/)
    end

    def file?
      @is_file ||= @value.is_a?(File) || @value.is_a?(Tempfile)
    end

    def html?
      @is_html ||= !(url? || file?)
    end

    def url
      raise InvalidURL unless url?
      @value
    end

    def html
      raise InvalidHTML if url?

      if html?
        @value
      else
        @value.read
      end
    end

  end
end