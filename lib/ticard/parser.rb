module Ticard
  class Parser

    def initialize(text)
      @text = text
    end

    def parse
      Card.new(content, :url => metadata("url"), :stored_md5 => metadata("md5"))
    end

    def content
      regex = /.*<!---.*?-->[\b\n]*(.*)/m
      regex.match(@text)[1]
    end

    def metadata(field)
      regex = /.*<!---.*?^\b*#{field} (.+?)$.*-->.+/m
      regex.match(@text)[1]
    end

  end
end
