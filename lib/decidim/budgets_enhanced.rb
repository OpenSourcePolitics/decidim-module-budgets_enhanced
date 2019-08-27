# frozen_string_literal: true

require "decidim/budgets_enhanced/admin"
require "decidim/budgets_enhanced/engine"
require "decidim/budgets_enhanced/admin_engine"

module Decidim
  # This namespace holds the logic of the `BudgetsEnhanced` component. This component
  # allows users to create budgets_enhanced in a participatory space.
  module BudgetsEnhanced
  end
  module ContentParsers
    autoload :ProjectParser, "decidim/content_parsers/project_parser"
  end

  module ContentRenderers
    autoload :ProjectRenderer, "decidim/content_renderers/project_renderer"
  end
end
