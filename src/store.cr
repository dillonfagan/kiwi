require "json"
require "./id"
require "./entry"

module Kiwi
  class Store
    include JSON::Serializable

    @data = Hash(ID, Entry).new
    getter name : String

    def initialize(@name : String)
    end

    def get(id : ID) : String
      assert_has(id)
      return @data[id].body
    end

    def put(value : String) : ID
      id = ID.new
      @data[id] = Entry.new(value)
      return id
    end

    def patch(id : ID, value : String)
      assert_has(id)
      @data[id].body = value
    end

    def delete(id : ID)
      assert_has(id)
      @data.delete(id)
    end

    private def assert_has(id : ID)
      raise Kiwi::StoreException.new("Invalid ID") if !@data.has_key?(id)
    end
  end
end
