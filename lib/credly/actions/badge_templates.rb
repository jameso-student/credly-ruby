module Credly
  module Actions
    module BadgeTemplates
      def badge_templates_get(params = {})
        connection.get("organizations/#{organization_id}/badge_templates", params)
      end

      def badge_templates_get_single(id)
        connection.get("organizations/#{organization_id}/badge_templates/#{id}")
      end
    end
  end
end