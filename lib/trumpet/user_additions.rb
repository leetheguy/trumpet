module Trumpet
  module UserAdditions
    def add_trumpet_methods
      include InstanceMethods
      extend ClassMethods
    end
    module InstanceMethods
      def hello
        puts 'hello squril'
      end
    end
    module ClassMethods
      def test
        puts 'test'
      end
    end
  end
end
