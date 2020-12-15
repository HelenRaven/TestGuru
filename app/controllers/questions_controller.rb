class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show destroy]
  before_action :all_questions, only: %i[index]
  before_action :find_test, only: %i[create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = "#{params.inspect}\n\n"
    @questions.each do |question|
      result += "id: #{question.id}, test_id: #{question.test_id}, body: #{question.body}\n"
    end
    render plain: result

  end

  def new

  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: @question.inspect
    else
      render :new
    end
  end

  def show
    render inline: '<%= @question.body%>'
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def all_questions
    @questions = params[:test_id].nil? ? Question.all : Test.find(params[:test_id].to_i).questions
  end

  def find_test
    @test = Test.find(params[:test_id].to_i)
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end
end
