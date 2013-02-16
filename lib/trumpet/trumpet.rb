require 'trumpet/railtie' if defined? Rails
module Trumpet
  class Railtie < Rails::Railtie
  end
  def self.hello
    puts 'hello self'
  end
end
#   def add_trumpet_methods
#     include InstanceMethods
#     extend ClassMethods
#   end
#   module InstanceMethods
#     def hello
#       puts 'hello squril'
#     end
#   end

#   module ClassMethods
#   end
