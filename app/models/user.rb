class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results
  has_many :created_tests, class_name: "Test"

  validates :password, :email, presence: true
  validates :password, length: {in: 6..25}

  def passed_tests_with_level(level)
    tests.where(level: level)
  end

end
