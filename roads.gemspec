# frozen_string_literal: true

require_relative "lib/roads/version"

Gem::Specification.new do |spec|
  spec.name = "roads"
  spec.version = Roads::VERSION
  spec.authors = ["Travis Siebenhaar"]
  spec.email = ["trsiebenhaar@gmail.com"]

  spec.summary = "Mock version of the Ruby on Rails gem."
  spec.description = "This gem was created for educational puproses on understanding the Ruby on Rails gem."
  spec.homepage = "https://github.com/TravisSiebenhaar/roads"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/TravisSiebenhaar/roads"
  spec.metadata["changelog_uri"] = "https://github.com/TravisSiebenhaar/roads/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'rack', '~> 2.2'
  spec.add_dependency 'erubis'

  # Testing dependencies
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rack-test'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
