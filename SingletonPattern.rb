# class SimpleLogger
#   @@instance = SimpleLogger.new

#   def self.instance
#     return @@instance
#   end

#   private_class_method :new
# end

require 'singleton'

class SimpleLogger
  include Sinleton
end