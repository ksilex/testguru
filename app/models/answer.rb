class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  scope :correct_answers, -> { where(correct: true) }
end
