class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  scope :correct_answers, -> { where(correct: true) }
  validate :max_answers

  def correct_output
    correct ? I18n.t(".output_yes") : I18n.t(".output_no")
  end

  private

  def max_answers
    errors.add(:question, I18n.t(".reached_max_answers")) if question.answers.size > 4
  end
end
