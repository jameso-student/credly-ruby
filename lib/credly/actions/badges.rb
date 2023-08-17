module Credly
  module Actions
    module Badges
      def badges_get
        connection.get("#{organization_id}/badges")
      end
    end
  end
end