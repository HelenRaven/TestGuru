class AnswersController < ApplicationController

  before_action :set_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  def new
    @answer = @question.answers.new
  end

  def show; end

  def edit; end


  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      render :new
    end

  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy

    redirect_to @answer.question
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def find_question
      @question = Question.find(params[:question_id])
    end
    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end