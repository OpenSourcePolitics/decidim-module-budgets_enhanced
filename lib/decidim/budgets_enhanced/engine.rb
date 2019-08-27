# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module BudgetsEnhanced
    # This is the engine that runs on the public interface of budgets_enhanced.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::BudgetsEnhanced

      routes do
        # Add engine routes here
        # resources :budgets_enhanced
        # root to: "budgets_enhanced#index"
      end

      initializer "decidim_budgets_enhanced.component_settings" do
        Decidim.find_component_manifest(:budgets).settings(:global) do |settings|
          settings.attribute :vote_per_budget, type: :boolean
          settings.attribute :vote_per_project, type: :boolean
          settings.attribute :total_projects, type: :integer, default: 5
          settings.attribute :geocoding_enabled, type: :boolean
        end
      end

      initializer "decidim_budgets_enhanced.assets" do |app|
        app.config.assets.precompile += %w(decidim_budgets_enhanced_manifest.js decidim_budgets_enhanced_manifest.css)
        app.config.assets.precompile += %w(decidim_budgets_manifest.js decidim_budgets_manifest.css)
      end
    end
  end
end
