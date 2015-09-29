require 'spec_helper'

describe RBattlenet::Wow::Pvp do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find_bracket" do
    it "fetches pvp leaderboard  data" do
      VCR.use_cassette('wow_pvp_2v2') do
        leaderboard = RBattlenet::Wow::Pvp.
          find_bracket("2v2")

        expect(leaderboard['rows'][0]['ranking']).to eq 1
      end
    end

    it "fetches pvp leaderboard  data" do
      VCR.use_cassette('wow_pvp_3v3') do
        leaderboard = RBattlenet::Wow::Pvp.
          find_bracket("3v3")

        expect(leaderboard['rows'][0]['ranking']).to eq 1
      end
    end

    it "does not fetch data due to invalid input" do
      expect do
        RBattlenet::Wow::Pvp.find_bracket("10v10")
      end.to raise_error(RuntimeError)
    end
  end
end
