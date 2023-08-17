module Credly
  module Actions
    module Badges
      def badges_get
        connection.get("/organizations/#{organization_id}/badges")
      end
    end
  end
end