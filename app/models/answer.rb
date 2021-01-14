class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  scope :correct_answers, -> { where(correct: true) }
  validate :max_answers

  private

  def max_answers
    errors.add(:question, "question can only have max of 4 answers") if question.answers.size >= 4
  end
end
