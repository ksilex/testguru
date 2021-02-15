class Badge < ApplicationRecord
  enum awarded_for: %i[first_try category_programming_complete hard_tests_complete]
  before_validation :before_validation_check_type, on: :create
  belongs_to :user

  URLS = { first_try: 'https://i.kym-cdn.com/photos/images/newsfeed/001/921/429/8a6',
           category_programming_complete: 'https://media1.tenor.com/images/b42091fbb1d367333cf76b2799b94d97/tenor.gif?itemid=16447711',
           hard_tests_complete: 'https://cdn.betterttv.net/emote/5590b223b344e2c42a9e28e3/3x' }.freeze
  TITLES = { first_try: 'Easy First Try',
             category_programming_complete: 'Programming Guru',
             hard_tests_complete: 'The Madman' }.freeze

  private

  def before_validation_check_type
    create_first_try_badge if first_try?
    create_category_programming_complete_badge if category_programming_complete?
    create_hard_tests_complete_badge if hard_tests_complete?
  end

  def create_first_try_badge
    self.title = TITLES[:first_try]
    self.image = URLS[:first_try]
  end

  def create_category_programming_complete_badge
    self.title = TITLES[:category_programming_complete]
    self.image = URLS[:category_programming_complete]
  end

  def create_hard_tests_complete_badge
    self.title = TITLES[:hard_tests_complete]
    self.image = URLS[:hard_tests_complete]
  end
end
