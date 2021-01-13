class Answer < ApplicationRecord

  belongs_to :question

  validates :body, presence: true
  validate :limit_number_of_answers

  scope :correct, -> { where(correct: true)}

  private

  def limit_number_of_answers
    errors.add( :body, I18n.t('.max_answers')) if question.answers.count >= question.max_number_of_answers

  end

end

