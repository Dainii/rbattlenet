require 'spec_helper'

describe RBattlenet::Wow::PetAbility, type: :game_data do

  describe "#find_pet_ability" do
    it "fetches pet_ability data" do
      with_connection("wow_pet_ability") do
        result = RBattlenet::Wow::PetAbility.find(110)
        expect(result.name).to eq "Bite"
      end
    end
  end

  describe "#find_multiple_pet_abilitys" do
    it "fetches pet_ability data" do
      with_connection("wow_pet_ability_multiple") do
        collection = RBattlenet::Wow::PetAbility.find([110, 112])
        expect(collection.results.map(&:name).sort).to eq ["Bite", "Peck"]
      end
    end
  end

  describe "#find_all_pet_abilitys" do
    it "fetches all pet_ability data" do
      with_connection("wow_pet_ability_all") do
        result = RBattlenet::Wow::PetAbility.all
        expect(result.abilities.size).to be >= 368
      end
    end
  end
end
