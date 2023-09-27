module Credly
    module Actions
      module IssuerAuthorizations

        def issuers_get(organization_id)
          connection.get("organizations/#{organization_id}/issuers")
        end
        
      end
    end
  end