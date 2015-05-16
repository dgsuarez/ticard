require 'spec_helper'

describe Ticard::FileRepository do

  let(:card) { Ticard::Card.new("Whatevs", :url => "https://trello.com/c/esKj234M/1-welcome-to-trello") }

  subject(:repository) { Ticard::FileRepository.new }

  describe "#path" do
    it "transforms a trello URL into a file name" do
      expect(repository.path(card)).to eq "esKj234M-1-welcome-to-trello.md"
    end
  end

  describe "#get" do
    it "reads a card from a file given its path" do
      content = File.read("spec/assets/card.md")
      File.stub(:read).with("esKj234M-1-welcome-to-trello.md").and_return(content)
      read_card = repository.get("esKj234M-1-welcome-to-trello.md")
      expect(read_card.content).to eql "I'm a text for the whatever\n" 
    end
  end

  describe "#put" do
    it "serializes the card and saves it to file" do
      f = double(File)
      f.should_receive(:<<).with(/welcome-to-trello/)
      File.stub(:open).and_yield(f)

      repository.put(card)
    end
  end

end
