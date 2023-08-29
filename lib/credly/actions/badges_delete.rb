module Credly
    module Actions
      module BadgeDelete
        def badges_delete(params = {})
          connection.get("organizations/#{organization_id}/badges_delete", params)
        end
      end
    end
  end