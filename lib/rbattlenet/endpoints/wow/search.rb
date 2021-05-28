module RBattlenet
  module Wow
    class Search < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :items]

      def self.items
        RBattlenet::Wow::Search::Item
      end
    end
  end
end
