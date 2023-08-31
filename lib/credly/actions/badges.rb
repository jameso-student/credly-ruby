module Credly
  module Actions
    module Badges
      def badges_get(params = {})
        connection.get("organizations/#{organization_id}/badges", params)
      end

      def badges_delete(badge_id)
        connection.delete("organizations/#{organization_id}/badges/#{badge_id}")
      end
    end
  end
end