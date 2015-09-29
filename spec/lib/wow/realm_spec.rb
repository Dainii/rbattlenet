require 'spec_helper'

describe RBattlenet::Wow::Realm do
  before do
    RBattlenet.authenticate(ENV["API"])
    RBattlenet.set_region("us", "en_us")
  end

  describe "#find" do
    it "fetches realm data" do
      VCR.use_cassette('wow_realm') do
        realms = RBattlenet::Wow::Realm.
          find

        expect(realms['realms'][0]['type']).to eq 'pvp'
      end
    end
  end
end
