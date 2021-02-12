class Feedback < ApplicationRecord
  validates :subject, :body, presence: true
  belongs_to :user
end
