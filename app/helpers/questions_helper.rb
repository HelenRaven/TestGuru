module QuestionsHelper

  def number_of_answers(question)
    question.answers.count
  end

  def question_header(question)
    "#{params[:action].capitalize} Question"
  end
end
