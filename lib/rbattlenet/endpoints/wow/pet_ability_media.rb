module RBattlenet
  module Wow
    class PetAbilityMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/pet-ability/#{id}?namespace=static-")
      end
    end
  end
end
