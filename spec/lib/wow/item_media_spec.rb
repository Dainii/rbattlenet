require 'spec_helper'

describe RBattlenet::Wow::ItemMedia, type: :game_data do

  describe "#find_item_media" do
    it "fetches item media data" do
      with_connection("wow_item_media") do
        result = RBattlenet::Wow::ItemMedia.find(19019)
        expect(result.assets.size).to be >= 1
      end
    end
  end

  describe "#find_multiple_item_families" do
    it "fetches item media data" do
      with_connection("wow_item_media_multiple") do
        collection = RBattlenet::Wow::ItemMedia.find([19019, 19020])
        expect(collection.results.map(&:assets).map(&:first).map(&:key).sort).to eq ["icon", "icon"]
      end
    end
  end
end
