# frozen_string_literal: true

require_relative "lib/htmltokit/version"

Gem::Specification.new do |spec|
  spec.name = "htmltokit"
  spec.version = HtmlToKit::VERSION
  spec.authors = ["Hopper Gee"]
  spec.email = ["hopper.gee@hey.com"]

  spec.summary = "Conver HTML to PDF/PNG/JPEG"
  spec.description = "Conver HTML to PDF/PNG/JPEG"
  spec.homepage = "https://github.com/htmltokit/htmltokit"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/htmltokit/htmltokit"
  spec.metadata["changelog_uri"] = "https://github.com/htmltokit/htmltokit/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "ferrum", "~> 0.13"
  spec.add_dependency 'active_method'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
