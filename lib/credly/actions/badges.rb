# frozen_string_literal: true

module Credly
  module Actions
    module Badges
      def badge_list(organization_id, badge_list_params = {})
        connection.get("organizations/#{organization_id}/badges", badge_list_params)
      end

      def badge_issue(organization_id, badge_issue_params)
        connection.post("organizations/#{organization_id}/badges", badge_issue_params)
      end

      def badge_delete(organization_id, badge_id)
        connection.delete("organizations/#{organization_id}/badges/#{badge_id}")
      end

      def badge_list_bulk(organization_id, badge_list_bulk_params = {})
        connection.get("organizations/#{organization_id}/high_volume_issued_badge_search", badge_list_bulk_params)
      end

      def badge_revoke(organization_id, badge_id, revoke_params)
        connection.put("organizations/#{organization_id}/badges/#{badge_id}/revoke", revoke_params)
      end

      def badge_replace(organization_id, badge_id, replace_params)
        connection.post("organizations/#{organization_id}/badges/#{badge_id}/replace", replace_params)
      end
    end
  end
end
