module RBattlenet
  module Wow
    class Battlepet
      def self.search_abilities(id)
        uri = RBattlenet.
          base_uri("#{GAME}/battlePet/ability/#{id}?")

        RBattlenet.get(uri)
      end

      def self.search_species(species_id)
        uri = RBattlenet.
          base_uri("#{GAME}/battlePet/species/#{species_id}?")

        RBattlenet.get(uri)
      end

      def self.search_stats(species_id, level, breed_id, quality_id)
        stats = [ {level: level},
                  {breedId: breed_id},
                  {qualityId: quality_id} ]

        options = RBattlenet.merge_options(stats)

        uri = RBattlenet.
          base_uri("#{GAME}/battlePet/stats/#{species_id}")

        RBattlenet.get(uri, options)
      end
    end
  end
end

