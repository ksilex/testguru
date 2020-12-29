class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  def tests_by_lvl(level)
    tests.where(level: level)
  end
end