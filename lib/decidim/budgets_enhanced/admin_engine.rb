# frozen_string_literal: true

module Decidim
  module BudgetsEnhanced
    # This is the engine that runs on the public interface of `BudgetsEnhanced`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::BudgetsEnhanced::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :budgets_enhanced do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "budgets_enhanced#index"
      end

      def load_seed
        nil
      end
    end
  end
end
