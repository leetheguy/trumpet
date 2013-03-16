module Trumpet
  module UserAdditions
    def add_trumpet_methods
      include InstanceMethods
      extend ClassMethods
    end
    module InstanceMethods
      attr_accessor :snarfle

      def initialize
        @snarfle = 'foo'
        super
      end

      def increase_points(value, type)
        @trumpet_rule = TrumpetRule.new
        points = self.class.find_or_create_points(type)
        points.total += value
        points.save
        rules_levels = rule_sheet.trumpet_levels[type]
        if rules_levels
          level = self.class.find_or_create_level(type)
          ttl = rules_levels.find_index{ |l| points.total < l }
          level.total = ttl || rules_levels.count
          level.save
        end
        points.total
      end
    end
    module ClassMethods
      def find_or_create_points(type)
        if (tp = TrumpetRule.where(acts_as_level: false, acts_as_achievement: false).find_by_name(type))
          tp
        else
          TrumpetRule.create(name: type, total: 0)
        end
      end
    end
  end
end
