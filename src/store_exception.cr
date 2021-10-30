module Kiwi
    class StoreException < Exception
        def initialize(@message : String)
        end
    end
end