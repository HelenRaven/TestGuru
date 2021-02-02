class HandlingBadgesService

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def hand_out_badges
      Badge.all.each do |badge|
        public_send(badge.rule.to_sym, param: badge.parameter, badge: badge)
    end
  end

  def all_in_category(param:, badge:)
    test_ary = Test.not_empty_tests.with_category(param).pluck(:id).sort
    check_rule(param, badge, test_ary)
  end

  def all_at_level(param:, badge:)
    test_ary = Test.not_empty_tests.with_level(param).pluck(:id).sort
    check_rule(param, badge, test_ary)
  end

  def for_first_time(param:, badge:)
    results = @user.results.test_with_title(param)
    if results.count == 1
      @user.badges.push(badge)
      results.last.badges.push(badge)
    end
  end

  private

  def unbaged_results
    badged_results_ids = @user.results.passed.with_badges.pluck(:id)
    @user.results.passed.except_ids(badged_results_ids)
  end

  def check_rule(param, badge, test_ary)
    results = unbaged_results
    result_ary = results.pluck(:test_id).uniq.sort

    if result_ary == test_ary
      @user.badges.push(badge)
      results.tests_results(test_ary).each do |result|
        result.badges.push(badge)
      end
    end
  end

end
