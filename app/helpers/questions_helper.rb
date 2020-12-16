module QuestionsHelper

  def number_of_answers(question)
    question.answers.count
  end

  def question_header(question, test)
    result = "#{params[:action].capitalize} '#{test.title}' Question"
  end
end
