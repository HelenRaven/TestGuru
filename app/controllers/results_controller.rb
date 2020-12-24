class ResultsController < ApplicationController

  before_action :set_result, only: %i[show update finish]

  def show
  end

  def finish

  end

  def update
    @result.accept!(params[:answer_ids])

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
