require 'spec_helper'

describe RBattlenet::Wow::Character::PvpBracket2v2, type: :game_data do

  describe "#find_character_pvp_bracket_2v2_statistics" do
    it "fetches character data" do
      with_connection("wow_character_pvp_bracket_2v2_statistics") do
        result = RBattlenet::Wow::Character::PvpBracket2v2.find(realm: "stormrage", name: "sheday")
        expect(result.rating.class).to eq Integer
      end
    end
  end
end
