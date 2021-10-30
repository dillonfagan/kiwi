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

    def patch(id : ID, value : String) : EntrySummary
      assert_has(id)
      @data[id].body = value
      return EntrySummary.new(id, @data[id])
    end

    def delete(id : ID) : EntrySummary
      assert_has(id)
      entry = @data[id]
      @data.delete(id)
      return EntrySummary.new(id, entry)
    end

    private def assert_has(id : ID)
      raise Kiwi::StoreException.new("Invalid ID") if !@data.has_key?(id)
    end
  end
end
