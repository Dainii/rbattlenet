module RBattlenet
  module Wow
    class Search < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :items, :spells]

      def self.items
        RBattlenet::Wow::Search::Item
      end

      def self.spells
        RBattlenet::Wow::Search::Spell
      end
    end
  end
end
