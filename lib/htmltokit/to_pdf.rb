class HtmlToKit
  class ToPDF < ActiveMethod::Base

    argument :path, default: nil 
    argument :opts, default: {}

    def call
      open_page
      save_pdf_on_disk
      close_browser
    end

    private

    def open_page
      if source.url?
        visit source.url
      else
        render source.html
      end
    end

    def visit(url)
      browser.go_to(url)
    end

    def render(html)
      browser.network.intercept
      html_intercepted = false
      browser.on(:request) do |request|
        if html_intercepted
          request.continue
        else
          html_intercepted = true
          request.respond(body: html)
        end
      end
      visit("http://example.com")
    end

    def save_pdf_on_disk
      browser.pdf(
        path: path || "example.pdf",
        format: opts[:format] || :A4,
        landscape: opts[:landscape] || false
      )
    end

    def close_browser
      browser.quit
    end

    def browser
      @browser ||= Ferrum::Browser.new
    end

    def source
      html_to_kit.source
    end

  end
end