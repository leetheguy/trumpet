#require 'trumpet/railtie' if defined? Rails
module Trumpet
  def add_rule_sheet_methods
    extend ClassMethods
    extend RuleClassMethods
    include RuleInstanceMethods
  end

  def add_trumpet_methods
    include InstanceMethods
    extend ClassMethods
  end

  class RuleSheet
    def foo
      'yo'
    end
  end

  module InstanceMethods
    attr_accessor :rules

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

    def find_or_create_achievement(type)
      if (tp = TrumpetRule.where(acts_as_level: false, acts_as_achievement: true).find_by_name(type))
        tp
      else
        TrumpetRule.create(name: type, acts_as_achievement: true, total: 0)
      end
    end

    def find_or_create_level(type)
      if (tp = TrumpetRule.where(acts_as_level: true, acts_as_achievement: false).find_by_name(type))
        tp
      else
        TrumpetRule.create(name: type, acts_as_level: true, total: 0)
      end
    end
  end

  module RuleInstanceMethods
    def initialize
      TrumpetRule.trumpet_levels = {}
      TrumpetRule.trumpet_achievements = {}
      super
    end

  end

  module RuleClassMethods
#    attr_accessor :trumpet_levels, :trumpet_achievements

    def declare_level(type, rules)
      level  = TrumpetRule.find_or_create_level(type)
      points = TrumpetRule.find_or_create_points(type)
      TrumpetRule.trumpet_levels[level.name] = rules
    end

    def declare_achievement(type, rule)
      achievement = TrumpetRule.find_or_create_achievement(type)
      points      = TrumpetRule.find_or_create_points(type)
      TrumpetRule.trumpet_achievements[achievement.name] = rule
    end
  end
end
