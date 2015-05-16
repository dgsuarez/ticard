require 'spec_helper'

describe Ticard::Serializer do

  subject(:serializer) do
    card = Ticard::Card.new("New text", :url => "http://example.com", :stored_md5 => "asdfasdf")  
    Ticard::Serializer.new(card)
  end

  describe "#serialize" do
    example do
      expect(serializer.serialize).to match(/url http:..example.com/)
      expect(serializer.serialize).to match(/md5 asdfasdf/)
      expect(serializer.serialize).to match(/New text/)
    end
  end

end
