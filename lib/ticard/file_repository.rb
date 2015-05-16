module Ticard
  class FileRepository

    def path(card)
      regex = /\/c\/(.*?)$/
      parts = regex.match(card.url)[1]
      base_name = parts.gsub("/","-")
      "#{base_name}.md"
    end

    def get(card_path)
      content = File.read(card_path)
      Parser.new(content).parse
    end

    def put(card)
      content = Serializer.new(card.as_stored).serialize
      File.open(path(card), 'w') { |f| f << content }
    end

  end
end
