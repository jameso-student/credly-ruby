# frozen_string_literal: true

module Credly
  module Actions
    module Organizations
      def organizations_list
        connection.get('organizations')
      end

      def organization_get(id)
        connection.get("organizations/#{id}")
      end

      def organization_update(id, update_params)
        connection.put("organizations/#{id}", update_params)
      end
    end
  end
end
