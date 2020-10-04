require 'spec_helper'

describe RBattlenet::Wow::Classic::CreatureFamilyMedia, type: :game_data do

  describe "#find_creature_family_media" do
    it "fetches creature media data" do
      with_connection("wow_classic_creature_family_media") do
        result = RBattlenet::Wow::Classic::CreatureFamilyMedia.find(1)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_creature_families" do
    it "fetches creature media data" do
      with_connection("wow_classic_creature_family_media_multiple") do
        collection = RBattlenet::Wow::Classic::CreatureFamilyMedia.find([1, 2])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["icon", "icon"]
      end
    end
  end
end
