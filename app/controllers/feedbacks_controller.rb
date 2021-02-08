class FeedbacksController < ApplicationController

  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    if @feedback.save
      FeedbacksMailer.feedback(@feedback).deliver_now
      redirect_to root_path, notice: t(".feedback_created")
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:subject, :body)
  end
end
