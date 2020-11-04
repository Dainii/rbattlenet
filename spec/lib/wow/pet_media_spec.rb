require 'spec_helper'

describe RBattlenet::Wow::PetMedia, type: :game_data do

  describe "#find_pet_media" do
    it "fetches pet media data" do
      with_connection("wow_pet_media") do
        result = RBattlenet::Wow::PetMedia.find(39)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_pet_media" do
    it "fetches pet media data" do
      with_connection("wow_pet_media_multiple") do
        collection = RBattlenet::Wow::PetMedia.find([39, 40])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["icon", "icon"]
      end
    end
  end
end
