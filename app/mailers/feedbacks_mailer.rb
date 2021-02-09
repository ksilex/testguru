class FeedbacksMailer < ApplicationMailer
  def feedback(feedback)
    @feedback = feedback
    mail subject: feedback.subject
  end
end
