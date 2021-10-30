require "./store"

module Kiwi
  class Base
    getter stores = Hash(String, Store).new

    def store(name : String) : Store
      assert_has(name)
      @stores[name]
    end

    def create(name : String)
      @stores[name] = Store.new(name)
    end

    private def assert_has(name : String)
      raise Kiwi::BaseException.new("Invalid store name") if !@stores.has_key?(name)
    end
  end
end