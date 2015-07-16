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
  spec.required_ruby_version = ">= 1.9.3"
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
  spec.add_runtime_dependency "thor", "~> 0.19.1"
  spec.add_runtime_dependency "minitar", "~> 0.5.4"
  spec.add_development_dependency "bundler", "~> 1.10.5"
  spec.add_development_dependency "rake", "~> 10.3.2"
  spec.add_development_dependency "awesome_print", "~> 1.2.0"
  spec.add_development_dependency "minitest-spec-context", "~> 0.0.3"
  spec.add_development_dependency "guard-minitest", "~> 2.3.1"
  spec.add_development_dependency "minitest", "~> 5.4.2"
  spec.add_development_dependency "guard", "~> 2.6.1"
  spec.add_development_dependency "pry", "~> 0.10.1"
  spec.add_development_dependency "gem-ctags", "~> 1.0.6"
  spec.add_development_dependency "yard", "~> 0.8.7"
  spec.add_development_dependency "rubocop", "~> 0.26.1"
end
