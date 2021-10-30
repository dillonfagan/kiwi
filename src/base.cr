require "file"
require "./store"

module Kiwi
  class Base
    @stores = Hash(String, Store).new

    def stores : Array(Store)
      return @stores.values
    end

    def has?(name : String) : Bool
      assert_has(name)
      return true
    rescue
      return false
    end

    def store(name : String) : Store
      assert_has(name)
      @stores[name]
    end

    private def assert_has(name : String)
      raise Kiwi::BaseException.new("Invalid store name") if !@stores.has_key?(name)
    end

    def create(name : String)
      assert_new(name)
      @stores[name] = BasicStore.new(name)
    end

    private def assert_new(name : String)
      raise Kiwi::BaseException.new("Store [ #{name} ] already exists") if @stores.has_key?(name)
    end

    def destroy(name : String)
      assert_has(name)
      @stores.delete(name)
    end

    def save(folder : String)
      File.write(Path.posix(folder, "base.kiwi"), @stores.to_json)
    end
  end
end