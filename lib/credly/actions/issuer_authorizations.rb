module Credly
    module Actions
      module IssuerAuthorizations

        def issuer_get(organization_id)
          connection.get("organizations/#{organization_id}/issuers")
        end

      end
    end
  end