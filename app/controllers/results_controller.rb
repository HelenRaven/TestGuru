class ResultsController < ApplicationController

  before_action :set_result, only: %i[show update finish gist]

  def show; end

  def finish; end

  def update
    if @result.empty_answer?(params[:answer_ids])
      flash.now[:notice] = t('.empty_answer')
    else
      @result.accept!(params[:answer_ids])
    end


    if @result.completed? || @result.time_off?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to finish_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question)
    last_call = result.call

    if result.success?
      flash_options = { notice: "#{view_context.link_to( t('.success'), last_call.html_url)}" }
      current_user.gists.create(question_id: @result.current_question.id, url: @result.current_question)
    else
      flash_options = { alert: t('.failure')}
    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

end
