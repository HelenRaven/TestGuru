module QuestionsHelper

  def number_of_answers(question)
    question.answers.count
  end

  def question_header(question)
    result = "#{params[:action].capitalize} '#{question.test.title}' Question"
  end
end
