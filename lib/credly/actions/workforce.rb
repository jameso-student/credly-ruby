# frozen_string_literal: true

module Credly
  module Actions
    module Workforce
      def employee_list(organization_id, query_params = {})
        connection.get("organizations/#{organization_id}/employees", query_params)
      end
    end
  end
end
