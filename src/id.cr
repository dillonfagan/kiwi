require "uuid"
require "json"

module Kiwi
  struct ID
    include JSON::Serializable
    @value : String

    def initialize
      @value = UUID.random.to_s
    end

    def initialize(@value : String)
    end

    def to_s
      return @value
    end

    def to_json_object_key
      return @value
    end
  end
end
