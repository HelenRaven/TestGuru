module QuestionsHelper

  def number_of_answers(question)
    question.answers.count
  end

  def question_header(question, text)
    result = "#{text} '#{Test.find(question.test_id).title}' Question"
  end
end
