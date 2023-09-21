# frozen_string_literal: true

module Credly
  module Actions
    module OBI
      def badge_assertion_get(badge_id)
        connection.get("obi/v2/badge_assertions/#{badge_id}")
      end

      def badge_class_get(badge_class_id)
        connection.get("obi/v2/badge_classes/#{badge_class_id}")
      end
    end
  end
end
