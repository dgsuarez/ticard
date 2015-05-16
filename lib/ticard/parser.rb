module Ticard
  class Parser

    def initialize(text)
      @text = text
    end

    def parse
      { :url => metadata("url"), :md5 => metadata("md5") }
    end

    def metadata(field)
      regex = /.*<!---.*#{field} (.+?)$.*-->.+/m
      regex.match(@text)[1]
    end

  end
end
