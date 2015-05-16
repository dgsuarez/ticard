require 'trello'

module Ticard
  class TrelloRepository

    def initialize(credentials={})
      Trello.configure do |config|
        config.developer_public_key = credentials[:developer_public_key]
        config.member_token = credentials[:member_token]
      end
    end

    def get(url)
      in_trello = card_in_trello(url)
      Card.new(in_trello.desc, :url => url).as_stored
    end

    def put(card)
      in_trello = card_in_trello(card.url)
      in_trello.desc = card.content
      in_trello.save
    end

    private

    def card_in_trello(url)
      regex = /\/c\/(.+?)\//
      id = regex.match(url)[1]
      Trello::Card.find(id) 
    end

  end
end

