class ResultsController < ApplicationController

  before_action :set_result, only: %i[show update finish]

  def show; end

  def finish; end

  def update
    unless @result.empty_answer?(params[:answer_ids])
      if params[:answer_ids].is_a?(Array)
        @result.accept!(params[:answer_ids])
      else
        @result.accept!([params[:answer_ids]])
      end
    else
      flash[:notice] = "You must chose at least one answer!"
    end

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to finish_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

end
