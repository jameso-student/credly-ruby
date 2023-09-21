# frozen_string_literal: true

module Credly
  module Actions
    module OBI
      def badge_assertion_get(badge_id)
        connection.get("obi/v2/badge_assertions/#{badge_id}")
      end
    end
  end
end
