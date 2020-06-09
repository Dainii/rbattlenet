module RBattlenet
  module Wow
    class Character::ActiveQuests < RBattlenet::Endpoints::Base
      def self.path(character)
        RBattlenet.uri("profile/wow/character/#{character[:realm]}/#{character[:name]}/quests?namespace=profile-")
      end
    end
  end
end
