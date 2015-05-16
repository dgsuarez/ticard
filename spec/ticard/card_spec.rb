require 'spec_helper'

describe Ticard::Card do

  it "knows the md5 of the current text" do
    card = Ticard::Card.new("New text")
    expect(card.current_md5).to eql "e0e5bd63c9d415c7fb84eecaa74c78fc"
  end

end
