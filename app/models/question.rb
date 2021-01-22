class Question < ApplicationRecord

  MAX_NUMBER_OF_ANSWERS = 4

  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true

  scope :not_empty, -> () { joins(:answers) }

  def max_number_of_answers
    MAX_NUMBER_OF_ANSWERS
  end

end
