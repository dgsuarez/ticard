require 'digest/md5'

module Ticard
  class Card

    attr_reader :content, :stored_md5, :url

    def initialize(content, opts={})
      @content = content
      @stored_md5 = opts[:stored_md5]
      @url = opts[:url]
    end

    def current_md5
      Digest::MD5.hexdigest(@content)
    end

  end
end

