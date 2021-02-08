class FeedbacksMailer < ApplicationMailer
  def feedback(feedback)
    @feedback = feedback
    mail to: feedback.user.email, subject: feedback.subject
  end
end
