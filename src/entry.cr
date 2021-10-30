require "time"
require "./header"

module Kiwi
  class Entry
    getter header : Header
    property body : String

    def initialize(@body : String)
      @header = Header.new
    end
  end
end
