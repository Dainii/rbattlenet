require 'spec_helper'

describe RBattlenet::Wow::Classic::Item, type: :game_data do

  describe "#find_item" do
    it "fetches item data" do
      with_connection("wow_classic_item") do
        result = RBattlenet::Wow::Classic::Item.find(19019)
        expect(result.name).to eq "Thunderfury, Blessed Blade of the Windseeker"
      end
    end
  end

  describe "#find_multiple_items" do
    it "fetches item data" do
      with_connection("wow_classic_item_multiple") do
        collection = RBattlenet::Wow::Classic::Item.find([19019, 19020])
        expect(collection.results.map(&:name).sort).to eq [
          "Camp Mojache Zukk'ash Report",
          "Thunderfury, Blessed Blade of the Windseeker"
        ]
      end
    end
  end
end
