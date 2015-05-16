module Ticard
  class LocalRepository

    def get(card_path)
      content = read(card_path)
      Parser.new(content).parse
    end

    def put(card)
      content = Serializer.new(card.as_stored).serialize
      write(card) { |f| f << content }
    end

  end
end
