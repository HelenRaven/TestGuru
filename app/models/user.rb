require 'digest/sha1'

class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results
  has_many :created_tests, class_name: "Test", foreign_key: :user_id

  validates :email, confirmation: {case_sensitive: false}
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}

  has_secure_password

  def passed_tests_with_level(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end

end
