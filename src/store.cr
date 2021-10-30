require "json"
require "./id"

module Kiwi
  class Store
    include JSON::Serializable

    @data = Hash(String, String).new
    getter name : String

    def initialize(@name : String)
    end

    def push(value : String) : ID
      id = ID.new
      @data[id.to_s] = value
      return id
    end

    def get(id : ID) : String
      return @data[id.to_s]
    end
  end
end
