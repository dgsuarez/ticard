require 'spec_helper'

describe Ticard::Card do

  describe "#md5" do
    it "knows the md5 of the current text" do
      card = Ticard::Card.new("New text")

      expect(card.current_md5).to eql "e0e5bd63c9d415c7fb84eecaa74c78fc"
    end

    it "strips the content before calculating md5" do
      trailed_card = Ticard::Card.new("\n\nNew text   \n")
      card = Ticard::Card.new("New text")

      expect(trailed_card.current_md5).to eql card.current_md5
    end
  end

  describe "#from_same_content_as?" do
    it "checks with another card to see if they come from the same content" do
      card = Ticard::Card.new("New text", :stored_md5 => "asdf")
      other_card = Ticard::Card.new("Other new text", :stored_md5 => "asdf")

      expect(card.from_same_content_as?(other_card)).to be_truthy
    end
  end

  describe "#as_stored" do
    it "returns a new card with the same content & url" do
      card = Ticard::Card.new("New text", :url => "asdf")
      stored = card.as_stored

      expect(stored.content).to eql card.content
      expect(stored.url).to eql card.url
    end

    it "sets the current_md5 as stored_md5 in the new card" do
      card = Ticard::Card.new("New text", :url => "asdf")
      stored = card.as_stored
      
      expect(stored.stored_md5).to eql card.current_md5
    end
  end


end
