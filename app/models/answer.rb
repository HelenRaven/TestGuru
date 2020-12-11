class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :limit_number_of_answers

  scope :right_answers, -> { where(right: true)}

  private

  def limit_number_of_answers
    errors.add(:body, "Question has maximum answers already!") if question.answers.count >= question.max_number_of_answers
  end
end
