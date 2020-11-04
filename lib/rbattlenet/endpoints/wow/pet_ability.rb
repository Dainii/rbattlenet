module RBattlenet
  module Wow
    class PetAbility < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/pet-ability/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/pet-ability/index?namespace=static-")
      end
    end
  end
end
