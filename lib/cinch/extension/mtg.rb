require 'cinch'
require 'net/http'
require 'json'

require "cinch/extension/mtg/version"

module Cinch
  module Extension
    class Mtg
      include Cinch::Plugin

      API_BASE_URL = URI('https://api.mtgdb.info')

      match /mtg (.*)/

      def execute(m, term)
        card = Card.new term
        cards = term.split(';').collect { |search_term| Card.new(search_term) }.compact

        cards.each do |card|
          m.reply(card.to_s)
        end
      end

      class Card
        attr_accessor :properties

        def initialize(name)
          card_name = name.gsub(/\s+/, '').downcase
          puts card_name
          uri = API_BASE_URL
          uri.path = "/cards/#{card_name}"
          puts uri.to_s

          response = Net::HTTP.get uri
          @properties = JSON.parse(response).first
          puts @properties
        end

        def to_s
          "#{Cinch::Formatting::format([:lime, :bold], @properties['name'])}(#{@properties['manaCost']}) #{@properties['power']}/#{@properties['toughness']}: #{@properties['description']} - #{Cinch::Formatting::format(:italic, @properties['flavor'])}"
        end
      end
    end
  end
end
