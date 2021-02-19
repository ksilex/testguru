class Badge < ApplicationRecord
  enum rule: %i[first_try category_complete hard_tests_complete]
  before_validation :before_validation_check_type, on: :create
  belongs_to :user
  belongs_to :category, optional: true

  URLS = { first_try: 'https://i.kym-cdn.com/photos/images/newsfeed/001/921/429/8a6',
           category_Programming_complete: 'https://media1.tenor.com/images/b42091fbb1d367333cf76b2799b94d97/tenor.gif?itemid=16447711',
           category_Music_complete: 'https://cdn.betterttv.net/emote/59a6d3dedccaf930aa8f3de1/3x',
           hard_tests_complete: 'https://cdn.betterttv.net/emote/5590b223b344e2c42a9e28e3/3x' }.freeze
  TITLES = { first_try: 'Easy First Try',
             category_Programming_complete: 'Programming Guru',
             category_Music_complete: 'Music Guru',
             hard_tests_complete: 'The Madman' }.freeze

  private

  def before_validation_check_type
    send "create_#{rule}_badge"
  end

  def create_first_try_badge
    self.title = TITLES[:first_try]
    self.image = URLS[:first_try]
  end

  def create_category_complete_badge
    self.title = TITLES[:"category_#{category.title}_complete"]
    self.image = URLS[:"category_#{category.title}_complete"]
  end

  def create_hard_tests_complete_badge
    self.title = TITLES[:hard_tests_complete]
    self.image = URLS[:hard_tests_complete]
  end
end
