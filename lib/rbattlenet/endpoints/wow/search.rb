module RBattlenet
  module Wow
    class Search < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :items, :spells, :creatures]

      def self.items
        RBattlenet::Wow::Search::Item
      end

      def self.spells
        RBattlenet::Wow::Search::Spell
      end

      def self.creatures
        RBattlenet::Wow::Search::Creature
      end
    end
  end
end
