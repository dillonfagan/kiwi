module Kiwi
  struct Header
    getter created : String

    def initialize
      @created = Time.utc.to_s
    end
  end
end
