class Badge < ApplicationRecord

  has_and_belongs_to_many :users, dependent: :destroy
  has_and_belongs_to_many :results, dependent: :destroy

  validates :name, :image_name, :rule, :parameter, presence: true

  IMAGES = "public/badges"

  RULES = [
    {name: :all_in_category,
     description: I18n.t('.all_in_category'),
     selector: Category.all.pluck(:title)
    },
    {name: :all_at_level,
     description: I18n.t('.all_at_level'),
     selector: Test.all.pluck(:level).uniq.sort
    },
    {name: :for_first_time,
     description: I18n.t('.for_first_time'),
     selector: Test.all.pluck(:title)
    }
  ]

  def get_rule_info(rule_name, param)
    rule_name = rule_name.to_sym unless rule_name.is_a?(Symbol)
    param = param.to_sym unless param.is_a?(Symbol)

    RULES.each do |rule|
      if rule[:name] == rule_name
        return rule[param]
      end
    end
  end

  def rules_selector
    rules = []
    RULES.each do |rule|
      rules << [rule[:description], rule[:name]]
    end
    rules
  end

  def rules
    RULES
  end

  def image_names
    Dir.children(IMAGES)
  end

  def self.hand_out_badges(user)
      Badge.all.each do |badge|
        public_send(badge.rule.to_sym, user: user, param: badge.parameter, badge: badge)
    end
  end


  def self.all_in_category(user:, param:, badge:)
    test_ary = Test.not_empty_tests.with_category(param).pluck(:id).sort
    check_rule(user, param, badge, test_ary)
  end

  def self.all_at_level(user:, param:, badge:)
    test_ary = Test.not_empty_tests.with_level(param).pluck(:id).sort
    check_rule(user, param, badge, test_ary)
  end

  def self.for_first_time(user:, param:, badge:)
    test_id = Test.with_title(param).ids.uniq
    results = user.results.tests_results(test_id)
    if results.count == 1 && results.last.passed == true
      user.badges.push(badge)
      results.last.badges.push(badge)
    end
  end

  def self.check_rule(user, param, badge, test_ary)
    badged_results_ids = Result.user_results(user).passed.with_badges.pluck(:id)
    unbadged_results = Result.user_results(user).passed.except_ids(badged_results_ids)
    result_ary = unbadged_results.pluck(:test_id).uniq.sort

    if result_ary == test_ary
      user.badges.push(badge)
      unbadged_results.tests_results(test_ary).each do |result|
        result.badges.push(badge)
      end
    end
  end

end
