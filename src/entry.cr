require "time"
require "json"
require "./header"

module Kiwi
  class Entry
    include JSON::Serializable
    getter header : Header
    property body : String

    def initialize(@body : String)
      @header = Header.new
    end
  end

  struct EntrySummary
    getter id : ID
    getter header : Header
    getter body : String

    def initialize(@id : ID, entry : Entry)
      @header = entry.header
      @body = entry.body
    end
  end
end
