require 'spec_helper'

describe Ticard::FdRepository do

  let(:card) { Ticard::Card.new("Whatevs", :url => "https://trello.com/c/esKj234M/1-welcome-to-trello") }
  let(:fake_in) { File.open("spec/assets/card.md")}
  let(:fake_out) { double(File).as_null_object }

  subject(:repository) { Ticard::FdRepository.new(fake_in, fake_out) }

  it "should read from the in" do
    expect(fake_in).to receive(:read).and_call_original

    repository.get(nil)
  end

  it "should write to the out" do
    expect(fake_out).to receive(:<<)

    repository.put(card)
  end

end

