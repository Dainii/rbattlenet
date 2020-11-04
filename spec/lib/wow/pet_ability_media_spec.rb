require 'spec_helper'

describe RBattlenet::Wow::PetAbilityMedia, type: :game_data do

  describe "#find_pet_ability_media" do
    it "fetches pet ability media data" do
      with_connection("wow_pet_ability_media") do
        result = RBattlenet::Wow::PetAbilityMedia.find(110)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_pet_ability_media" do
    it "fetches pet ability media data" do
      with_connection("wow_pet_ability_media_multiple") do
        collection = RBattlenet::Wow::PetAbilityMedia.find([110, 111])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["icon", "icon"]
      end
    end
  end
end
