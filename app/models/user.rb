class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results
  has_many :created_tests, class_name: "Test"

  validates :password, :email, :email_confirmation, presence: true
  validates :email, confirmation: {case_sensitive: false}
  validates :password. length: {in: 6..25}

  scope :passed_tests_with_level, -> (user, level) { user.tests.where(level: level)}

  def passed_tests_with_level(level)
    tests.where(level: level)
  end

end
