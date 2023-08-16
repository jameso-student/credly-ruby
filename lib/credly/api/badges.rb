module Credly
  module API
    class Badges
      def initialize(connection)
        @connection = connection
      end

      def all
        @connection.get 'badges'
      end
    end
  end
end