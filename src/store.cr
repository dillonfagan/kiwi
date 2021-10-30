require "json"
require "./id"

module Kiwi
  class Store
    include JSON::Serializable

    @data = Hash(String, String).new
    getter name : String

    def initialize(@name : String)
    end

    def get(id : ID) : String
      assert_has(id)
      return @data[id.to_s]
    end

    def push(value : String) : ID
      id = ID.new
      @data[id.to_s] = value
      return id
    end

    def patch(id : ID, value : String)
      assert_has(id)
      @data[id.to_s] = value
    end

    def delete(id : ID)
      assert_has(id)
      @data.delete(id.to_s)
    end

    private def assert_has(id : ID)
      raise Kiwi::StoreException.new("Invalid ID") if !@data.has_key?(id.to_s)
    end
  end
end
