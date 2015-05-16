module Ticard
  class FileRepository < LocalRepository

    protected

    def path(card)
      regex = /\/c\/(.+?)\/\d*-?(.*?)\/?$/
      match = regex.match(card.url)
      id = match[1]
      name = match[2]
      "#{name}_#{id}.md"
    end

    def read(card_path)
      File.read(card_path)
    end

    def write(card, &b)
      File.open(path(card), 'w', &b)
    end

  end
end
