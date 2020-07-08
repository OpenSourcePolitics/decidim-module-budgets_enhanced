# frozen_string_literal: true

module Decidim
  module Budgets
    # Exposes the project resource so users can view them
    class ProjectsController < Decidim::Budgets::ApplicationController
      include FilterResource
      include NeedsCurrentOrder
      include Orderable
      include Decidim::Budgets::Orderable

      helper_method :projects, :project, :geocoded_projects

      private

      def projects
        return @projects if @projects

        @projects = search.results.page(params[:page]).per(current_component.settings.projects_per_page)
        @projects = reorder(@projects)
      end

      def project
        @project ||= search.results.find(params[:id])
      end

      def search_klass
        ProjectSearch
      end

      def default_filter_params
        {
          search_text: "",
          scope_id: "",
          category_id: ""
        }
      end

      def context_params
        { component: current_component, organization: current_organization }
      end

      def geocoded_projects
        return @geocoded_projects if @geocoded_projects

        @geocoded_projects = search.results.select(&:geocoded?)
        @geocoded_projects = reorder(@geocoded_projects)
      end
    end
  end
end
