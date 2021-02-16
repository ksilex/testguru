class AwardUsersService
  attr_reader :test_passage, :user, :test

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    check_for_award
  end

  def first_try_badge
    if TestPassage.where(user: user, test: test).size == 1
      create_badge(:first_try)
    end
  end

  def category_programming_complete_badge
    if first_time?(:category_programming_complete) &&
       Test.by_category("Programming").ids.sort == user.test_passages.where(
                                                   test: Test.by_category("Programming").pluck(:id),
                                                   success: true)
                                                   .pluck(:test_id).uniq.sort
      create_badge(:category_programming_complete)
    end
  end

  def hard_tests_complete_badge
    if first_time?(:hard_tests_complete) &&
       Test.hard_lvls.ids.sort == user.test_passages.where(test: Test.hard_lvls, success: true)
                                                    .pluck(:test_id).uniq.sort
      create_badge(:hard_tests_complete)
    end
  end

  private

  def create_badge(type)
    user.badges.create(awarded_for: type)
  end

  def check_for_award
    first_try_badge
    category_programming_complete_badge
    hard_tests_complete_badge
  end

  def first_time?(award)
    Badge.where(awarded_for: award, user: user).empty?
  end
end
