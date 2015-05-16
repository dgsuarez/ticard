require 'erb'

module Ticard
  class Serializer
    def initialize(card)
      @card = card
    end

    def serialize
      template = ERB.new(File.read("lib/ticard/card.md.erb"))
      template.result(@card.instance_eval { binding })
    end
  end
end

