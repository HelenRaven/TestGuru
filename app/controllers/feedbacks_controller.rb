class FeedbacksController < ApplicationController

  def new;  end

  def create
    @feedback = get_feedback
    if @feedback
      @feedback[:user] = current_user
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: (t'.feedback')
    else
      redirect_to new_feedback_path
    end
  end

  private

  def get_feedback
    params.require(:feedback).permit(:subject, :message)
  end

end
