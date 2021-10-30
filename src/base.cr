require "./store"

module Kiwi
  class Base
    getter stores = Hash(String, Store).new

    def store(name : String) : Store
      assert_has(name)
      @stores[name]
    end

    private def assert_has(name : String)
      raise Kiwi::BaseException.new("Invalid store name") if !@stores.has_key?(name)
    end

    def create(name : String)
      assert_new(name)
      @stores[name] = Store.new(name)
    end

    private def assert_new(name : String)
      raise Kiwi::BaseException.new("Store [ #{name} ] already exists") if @stores.has_key?(name)
    end

    def destroy(name : String)
      assert_has(name)
      @stores.delete(name)
    end
  end
end