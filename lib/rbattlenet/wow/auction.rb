module RBattlenet
  module Wow
    class Auction
      def self.search(realm)
        uri = RBattlenet.base_uri("#{GAME}/auction/data/#{realm}?")

        RBattlenet.get(uri)
      end
    end
  end
end
