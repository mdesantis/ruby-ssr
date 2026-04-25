# frozen_string_literal: true

require_relative "lib/ssr"

Gem::Specification.new do |spec|
  spec.name = "ssr"
  spec.version = SSR::VERSION
  spec.authors = ["Maurizio De Santis"]
  spec.email = ["desantis.maurizio@gmail.com"]

  spec.summary = "A placeholder gem reserving the SSR namespace."
  spec.description = "This gem exists solely to reserve the `SSR` module namespace on RubyGems.org, preventing others from publishing a potentially bloated or malicious gem under this name."
  spec.homepage = "https://github.com/mdesantis/ssr"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mdesantis/ssr"
  spec.metadata["changelog_uri"] = "https://github.com/mdesantis/ssr/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
