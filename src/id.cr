require "uuid"

module Kiwi
  struct ID
    @value : String

    def initialize
      @value = UUID.random.to_s
    end

    def initialize(@value : String)
    end

    def to_s
      return @value
    end
  end
end
