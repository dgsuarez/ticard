require 'yaml'

module Ticard
  module Interactions

    def self.create(url)
      card = trello_repo.get(url)
      file_repo.put(card)
    end

    def self.write(path)
      local_card = file_repo.get(path)
      remote_card = trello_repo.get(card.path)
      if local_card.from_same_content_as?(remote_card) || confirm_overwrite
        trello_repo.put(card)
        file_repo.put(card)
      end
    end

    private

    def self.confirm_overwrite
      puts "Card has been changed since downloaded, save anyway? (y/N)"
      resp = gets.chomp
      resp.downcase == "y"
    end

    def self.trello_repo
      @_trello_repo ||= TrelloRepository.new(trello_credentials)
    end

    def self.file_repo
      @_file_repo ||= FileRepository.new
    end

    def self.trello_credentials
      %w(PWD HOME).map { |e| "#{ENV[e]}/.ticard.yml" }.detect { |p| File.exist?(p) }
      YAML.load_path(path)["keys"]
    end

  end
end

