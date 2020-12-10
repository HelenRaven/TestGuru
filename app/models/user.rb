class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results
  has_many :created_tests, class_name: "Test"

  def passed_tests_with_level(level)
    Test.joins(:results)
        .where("user_id = :id AND tests.level = :level", id: self.id, level: level)
        .select(:title)
  end
end
