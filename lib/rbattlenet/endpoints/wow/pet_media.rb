module RBattlenet
  module Wow
    class PetMedia < RBattlenet::Endpoints::Base
      def self.path(id)
        RBattlenet.uri("data/wow/media/pet/#{id}?namespace=static-")
      end
    end
  end
end
