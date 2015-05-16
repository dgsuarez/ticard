require 'spec_helper'

describe Ticard::TrelloRepository do

  let(:card) { Ticard::Card.new("Whatevs", :url => "https://trello.com/c/esKj234M/1-welcome-to-trello") }

  let(:fake_card) { double(Trello::Card, :desc => "You watch a flea") }

  subject(:repository) { Ticard::TrelloRepository.new }

  before :each do
    Trello::Card.stub(:find).with("esKj234M").and_return(fake_card)
  end

  describe "#get" do
    it "reads a card from trello given its url" do
      read_card = repository.get("https://trello.com/c/esKj234M/1-welcome-to-trello")

      expect(read_card.content).to eql "You watch a flea"
    end

    it "sets the metadata of the returned card" do
      read_card = repository.get("https://trello.com/c/esKj234M/1-welcome-to-trello")

      expect(read_card.stored_md5).to eql "586c3a77ac3cd453ca1839a6b04506cc"
      expect(read_card.url).to eql card.url
    end
  end

  describe "#put" do
    it "saves the card with the new description" do
      expect(fake_card).to receive(:desc=).with(card.content)
      expect(fake_card).to receive(:save)

      repository.put(card)
    end
  end
end

