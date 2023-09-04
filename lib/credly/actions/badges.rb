# frozen_string_literal: true

module Credly
  module Actions
    module Badges
      def badges_get(params = {})
        connection.get("organizations/#{organization_id}/badges", params)
      end

      def badges_delete(badge_id)
        connection.delete("organizations/#{organization_id}/badges/#{badge_id}")
      end

      def badges_revoke(badge_id, revoke_params)
        connection.put("organizations/#{organization_id}/badges/#{badge_id}/revoke", revoke_params)
      end

      def badges_replace(badge_id, params)
        connection.post("organizations/#{organization_id}/badges/#{badge_id}/replace", params)
      end
  
    end
  end
end
