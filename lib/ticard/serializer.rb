require 'erb'

module Ticard
  class Serializer
    def initialize(card)
      @card = card
    end

    def serialize
      erb_path = File.join(File.dirname(File.expand_path(__FILE__)), 'card.md.erb')
      template = ERB.new(File.read(erb_path))
      template.result(@card.instance_eval { binding })
    end
  end
end

