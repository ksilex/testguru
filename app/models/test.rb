class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, ->(category) {
    joins(:category).where("categories.title = ?", category)
  }
  scope :easy_lvls,   -> { where(level: 0..1) }
  scope :medium_lvls, -> { where(level: 2..4) }
  scope :hard_lvls,   -> { where(level: 5..Float::INFINITY) }

  def self.titles_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end

  def timer_convert_to_seconds
    (timer.strftime("%H").to_i * 3600 + timer.strftime("%M").to_i * 60 +
    timer.strftime("%S").to_i).seconds
  end
end
