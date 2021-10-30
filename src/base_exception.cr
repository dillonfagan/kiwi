module Kiwi
    class BaseException < Exception
        def initialize(@message : String)
        end
    end
end