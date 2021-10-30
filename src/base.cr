require "./store"

module Kiwi
  class Base
    getter stores = Hash(String, Store).new

    def store(name : String) : Store
      @stores[name]
    end

    def create(name : String)
      @stores[name] = Store.new(name)
    end
  end
end