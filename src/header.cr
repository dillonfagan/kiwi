require "json"

module Kiwi
  struct Header
    include JSON::Serializable
    getter created : String

    def initialize
      @created = Time.utc.to_s
    end
  end
end
