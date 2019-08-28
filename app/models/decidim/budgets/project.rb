# frozen_string_literal: true

module Decidim
  module Budgets
    # The data store for a Project in the Decidim::Budgets component. It stores a
    # title, description and any other useful information to render a custom project.
    class Project < Budgets::ApplicationRecord
      include Decidim::Resourceable
      include Decidim::HasComponent
      include Decidim::ScopableComponent
      include Decidim::HasCategory
      include Decidim::HasAttachments
      include Decidim::HasAttachmentCollections
      include Decidim::HasReference
      include Decidim::Followable
      include Decidim::Comments::Commentable
      include Decidim::Traceable
      include Decidim::Loggable
      component_manifest_name "budgets"
      has_many :line_items, class_name: "Decidim::Budgets::LineItem", foreign_key: "decidim_project_id", dependent: :destroy
      has_many :orders, through: :line_items, foreign_key: "decidim_project_id", class_name: "Decidim::Budgets::Order"

      geocoded_by :address, http_headers: ->(project) { { "Referer" => project.component.organization.host } }

      def self.log_presenter_class_for(_log)
        Decidim::Budgets::AdminLog::ProjectPresenter
      end

      # Public: Overrides the `commentable?` Commentable concern method.
      def commentable?
        component.settings.comments_enabled?
      end

      # Public: Overrides the `accepts_new_comments?` Commentable concern method.
      def accepts_new_comments?
        commentable? && !component.current_settings.comments_blocked
      end

      # Public: Overrides the `comments_have_votes?` Commentable concern method.
      def comments_have_votes?
        true
      end

      # Public: Overrides the `users_to_notify_on_comment_created` Commentable concern method.
      def users_to_notify_on_comment_created
        participatory_process = component.participatory_space
        admins = component.organization.admins
        users_with_role = component.organization.users_with_any_role
        process_users_with_role = get_user_with_process_role(participatory_process.id)
        users = admins + users_with_role + process_users_with_role
        users.uniq
      end

      def get_user_with_process_role(participatory_process_id)
        Decidim::ParticipatoryProcessUserRole.where(decidim_participatory_process_id: participatory_process_id).map(&:user)
      end

      # Public: Returns the number of times an specific project have been checked out.
      def confirmed_orders_count
        orders.finished.count
      end

      # Public: Overrides the `allow_resource_permissions?` Resourceable concern method.
      def allow_resource_permissions?
        component.settings.resources_permissions_enabled
      end

      # Public: Whether the object can have new comments or not.
      def user_allowed_to_comment?(user)
        can_participate_in_space?(user)
      end
    end
  end
end
