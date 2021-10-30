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

    def get(id : ID) : EntrySummary
      assert_has(id)
      entry = @data[id]
      return EntrySummary.new(id, entry)
    end

    def put(value : String) : EntrySummary
      id = ID.new
      entry = Entry.new(value)
      @data[id] = entry
      return EntrySummary.new(id, entry)
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
