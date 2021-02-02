class Result < ApplicationRecord

  PASS_PERCENT = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :question_id, optional: true
  has_and_belongs_to_many :badges, dependent: :destroy

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question, unless: :completed?

  scope :passed,          ->              { where(passed: true)}
  scope :with_badges,     ->              { joins(:badges)}
  scope :except_ids,      -> (ids_ary)    { where.not(id: ids_ary)}
  scope :tests_results,   -> (tests_ids)  { where(test_id: tests_ids)}
  scope :test_with_title, -> (test_title) { joins(:test).where("tests.title = ?", test_title)}

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

  def progress_bar_string
    question_number.to_s + ' / ' + self.test.questions.count.to_s
  end

  def result_percentage
    correct_questions.to_f / self.test.questions.count * 100
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

  def seconds_left
    past_seconds = (Time.now - self.created_at).to_i
    timer_seconds = self.test.timer * 60
    timer_seconds - past_seconds
  end

  def time_off?
    if self.test.timer
      seconds_left <= 0
    else
      false
    end
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
