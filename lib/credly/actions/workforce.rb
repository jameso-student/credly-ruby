# frozen_string_literal: true

module Credly
  module Actions
    module Workforce
      def employee_list(organization_id, query_params = {})
        connection.get("organizations/#{organization_id}/employees", query_params)
      end

      def employee_get(organization_id, employee_id)
        connection.get("organizations/#{organization_id}/employees/#{employee_id}")
      end

      def employee_update(organization_id, employee_id, body_params)
        connection.put("organizations/#{organization_id}/employees/#{employee_id}", body_params)
      end
      
      def employee_create(organization_id, body_params)
        connection.post("organizations/#{organization_id}/employees", body_params)
      end
    end
  end
end
