module RBattlenet
  module Wow
    class Covenant < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself]

      def self.path(id)
        RBattlenet.uri("data/wow/covenant/#{id}?namespace=static-")
      end

      def self.index_path
        RBattlenet.uri("data/wow/covenant/index?namespace=static-")
      end
    end
  end
end
