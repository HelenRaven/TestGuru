class Question < ApplicationRecord

  MAX_NUMBER_OF_ANSWERS = 4

  belongs_to :test
  has_many :answers

  validates :body, presence: true

  def max_number_of_answers
    MAX_NUMBER_OF_ANSWERS
  end

end
