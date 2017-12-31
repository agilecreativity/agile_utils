# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "agile_utils/version"
Gem::Specification.new do |spec|
  spec.name          = "agile_utils"
  spec.version       = AgileUtils::VERSION
  spec.authors       = ["Burin Choomnuan"]
  spec.email         = ["agilecreativity@gmail.com"]
  spec.summary       = %q(Collection of my ruby library that can be re-used across projects)
  spec.description   = %q(My collection of library that I have used that can be shared across multiple projects)
  spec.homepage      = "https://github.com/agilecreativity/agile_utils"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.2.0"
  spec.files         = Dir.glob("{bin,lib}/**/*") + %w[Gemfile
                                                       Rakefile
                                                       agile_utils.gemspec
                                                       README.md
                                                       CHANGELOG.md
                                                       LICENSE
                                                       .rubocop.yml
                                                       .gitignore]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob("{test}/**/*")
  spec.require_paths = ["lib"]
  spec.add_development_dependency "awesome_print","~> 1.8"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "guard", "~> 2.14"
  spec.add_development_dependency "guard-minitest", "~> 2.3"
  spec.add_development_dependency "minitest", "~> 5.10"
  spec.add_development_dependency "minitest-spec-context", "~> 0.0"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rubocop", "~> 0.52"
  spec.add_development_dependency "yard", "~> 0.9"
  spec.add_runtime_dependency "minitar", "~> 0.6"
  spec.add_runtime_dependency "thor", "~> 0.20"
end
