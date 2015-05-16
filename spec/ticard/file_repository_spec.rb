require 'spec_helper'

describe Ticard::FileRepository do

  let(:card) { Ticard::Card.new("Whatevs", :url => "https://trello.com/c/esKj234M/1-welcome-to-trello") }

  subject(:repository) { Ticard::FileRepository.new }

  describe "#get" do
    it "reads a card from a file given its path" do
      content = File.read("spec/assets/card.md")
      allow(File).to receive(:read).with("welcome-to-trello_esKj234M.md").and_return(content)
      read_card = repository.get("welcome-to-trello_esKj234M.md")
      expect(read_card.content).to eql "I'm a text for the whatever\n" 
    end
  end

  describe "#put" do

    it "saves to a file name including both id and name" do
      expect(File).to receive(:open).with("welcome-to-trello_esKj234M.md", "w")

      repository.put(card)
    end

    it "serializes the card and saves it to file" do
      f = double(File)
      expect(f).to receive(:<<).with(/welcome-to-trello/)
      allow(File).to receive(:open).and_yield(f)

      repository.put(card)
    end

    it "saves the new md5 in the file" do
      f = double(File)
      expect(f).to receive(:<<).with(/md5 656400/)
      allow(File).to receive(:open).and_yield(f)

      repository.put(card)
    end
  end

end
