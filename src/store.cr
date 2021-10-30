require "json"
require "./id"
require "./entry"

module Kiwi
  abstract class Store
    abstract def name : String
    abstract def get(id : ID) : EntrySummary
    abstract def put(value : String) : EntrySummary
    abstract def patch(id : ID, value : String) : EntrySummary
    abstract def delete(id : ID) : EntrySummary
    abstract def dump : StoreDump
  end

  struct StoreDump
    getter json : String

    def initialize(@json : String)
    end
  end

  class BasicStore < Store
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

    def dump : StoreDump
      return StoreDump.new(to_json)
    end
  end
end
