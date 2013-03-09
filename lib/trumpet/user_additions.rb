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
      def find_or_create_points(type, model)
        if (tp = TrumpetRule.where(acts_as_level: false, acts_as_achievement: false).find_by_name(type))
          tp
        else
          TrumpetRule.create(name: type, total: 0)
        end
      end
      def test
        puts 'test'
      end
    end
  end
end
