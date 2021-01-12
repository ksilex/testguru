class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates :answers, length: { minimum: 1, maximum: 4 }
  validates :body, presence: true
end
