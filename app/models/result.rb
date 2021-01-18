class Result < ApplicationRecord

  PASS_PERCENT = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :question_id, optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def accept!(answer_ids)
    answer_ids = [answer_ids] unless answer_ids.is_a?(Array)

    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def question_number
    self.test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def result_percentage
    correct_questions / self.test.questions.count * 100
  end

  def passing_percentage
    (question_number.to_f / self.test.questions.count.to_f * 100).to_i
  end

  def test_passed?
    result_percentage >= PASS_PERCENT
  end

  def empty_answer?(answer_ids)
    answer_ids.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
