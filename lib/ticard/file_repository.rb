module Ticard
  class FileRepository < LocalRepository

    def path(card)
      regex = /\/c\/(.*?)$/
      parts = regex.match(card.url)[1]
      base_name = parts.gsub("/","-")
      "#{base_name}.md"
    end

    protected

    def read(card_path)
      File.read(card_path)
    end

    def write(card, &b)
      File.open(path(card), 'w', &b)
    end

  end
end
