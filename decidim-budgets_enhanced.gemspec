# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/budgets_enhanced/version"

Gem::Specification.new do |s|
  s.version = Decidim::BudgetsEnhanced.version
  s.authors = ["Armand"]
  s.email = ["fardeauarmand@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-budgets_enhanced"
  s.required_ruby_version = ">= 2.5"

  s.name = "decidim-budgets_enhanced"
  s.summary = "A decidim budgets_enhanced module"
  s.description = "Budgets nehanced."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-budgets", Decidim::BudgetsEnhanced.version
  s.add_dependency "decidim-core", Decidim::BudgetsEnhanced.version
  s.add_development_dependency "decidim-dev", Decidim::BudgetsEnhanced.version
end
