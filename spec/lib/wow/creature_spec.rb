require 'spec_helper'

describe RBattlenet::Wow::Creature, type: :game_data do

  describe "#find_creature" do
    it "fetches creature data" do
      with_connection("wow_creature") do
        result = RBattlenet::Wow::Creature.find(30)
        expect(result.name).to eq "Forest Spider"
      end
    end
  end

  describe "#find_multiple_creatures" do
    it "fetches creature data" do
      with_connection("wow_creature_multiple") do
        collection = RBattlenet::Wow::Creature.find([30, 330])
        expect(collection.results.map(&:name).sort).to eq ["Forest Spider", "Princess"]
      end
    end
  end
end
