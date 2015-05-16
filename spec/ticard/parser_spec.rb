require 'spec_helper'

describe Ticard::Parser do

  let(:text) { File.read("spec/assets/card.md") }

  it "gets the URL of the card from the comment at the top" do
    parser = Ticard::Parser.new(text)
    expect(parser.parse.url).to eql "http://example.com/mycard"
  end

  it "gets the MD5 of the card from the comment at the top" do
    parser = Ticard::Parser.new(text)
    expect(parser.parse.stored_md5).to eql "12f6bb1941df66b8f138a446d4e8670c"
  end

  it "gets the actual markdown content" do
    parser = Ticard::Parser.new(text)
    expect(parser.parse.content).to eql "I'm a text for the whatever\n"
  end

end
