$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "houston/kanban/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name          = "houston-kanban"
  spec.version       = Houston::Kanban::VERSION
  spec.authors       = ["Bob Lail"]
  spec.email         = ["bob.lailfamily@gmail.com"]

  spec.summary       = "A Kanban-style dashboard for tickets"
  spec.homepage      = "https://github.com/houston/houston-kanban"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
  spec.test_files = Dir["test/**/*"]

  spec.add_dependency "houston-core", ">= 0.8.0.pre"
  spec.add_dependency "houston-tickets"

  spec.add_development_dependency "bundler", "~> 1.11.2"
  spec.add_development_dependency "rake", "~> 10.0"
end
