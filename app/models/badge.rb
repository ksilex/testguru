class Badge < ApplicationRecord
  enum awarded_for: %i[first_try category_programming_complete]
  before_validation :before_validation_check_type, on: :create
  belongs_to :user

  URLS = {first_try: 'https', category_programming_complete: 'jopa'}.freeze
  TITLES = {first_try: 'First Try Badge', category_programming_complete: 'jopa'}.freeze

  private

  def before_validation_check_type
    create_first_try_badge if first_try?
    create_category_programming_complete_badge if category_programming_complete?
  end

  def create_first_try_badge
    self.title = TITLES[:first_try]
    self.image = URLS[:first_try]
  end

  def create_category_programming_complete_badge
    self.title = TITLES[:category_programming_complete]
    self.image = URLS[:category_programming_complete]
  end
end
