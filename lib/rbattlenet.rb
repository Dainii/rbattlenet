require 'httparty'
require "rbattlenet/version"

require_relative "./rbattlenet/wow/character.rb"
require_relative "./rbattlenet/wow/achievement.rb"
require_relative "./rbattlenet/wow/auction.rb"
require_relative "./rbattlenet/wow/battlepet.rb"
require_relative "./rbattlenet/wow/challenge.rb"
require_relative "./rbattlenet/wow/item.rb"
require_relative "./rbattlenet/wow/guild.rb"
require_relative "./rbattlenet/wow/pvp.rb"
require_relative "./rbattlenet/wow/quest.rb"
require_relative "./rbattlenet/wow/realm.rb"
require_relative "./rbattlenet/wow/recipe.rb"
require_relative "./rbattlenet/wow/spell.rb"
require_relative "./rbattlenet/wow/data_resources.rb"


require_relative "./rbattlenet/d3/profile.rb"
require_relative "./rbattlenet/d3/data_resources.rb"

module RBattlenet
  @@region = "us"
  @@locale = "en_us"

  def self.authenticate(api_key)
    @@api_key = api_key

    @@options = "?locale=#{@@locale}&apikey=#{@@api_key}"
  end

  def self.set_region(region, locale)
    @@region = region
    @@locale = locale
    @@options = "?locale=#{@@locale}&apikey=#{@@api_key}"
  end

  module Wow; GAME = "wow" end
  module D3; GAME = "d3" end

  private

  class << self
    def get(uri, options = @@options)
      HTTParty.get(uri + options)
    end

    def base_uri(path)
      "https://#{@@region}.api.battle.net/#{path}"
    end

    def parse_spaces(input)
      input.gsub(" ", '%20')
    end

    def merge_options(options)
      @@options + "#{options}"
    end

    def parse_fields(fields)
      unless fields.nil?
        fields.map! do |field|
          field.gsub(/\s\S/,&:upcase).gsub(/\s/, "")
        end
        "&fields=" + fields.join("+")
      end
    end
  end
end

