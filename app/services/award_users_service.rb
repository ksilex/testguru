class AwardUsersService
  attr_reader :test_passage, :user, :test, :category

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    @category = @test.category
  end

  def call
    Badge.rules.each do |rule, _num|
      send "#{rule}_badge"
    end
  end

  def first_try_badge
    if TestPassage.where(user: user, test: test).size == 1
      create_badge(:first_try)
    end
  end

  def category_complete_badge
    if first_time_award?(:category_complete, category) &&
       Test.by_category(category.title).order(:id).ids == user.test_passages.where(
                                                                                  test: Test.by_category(category.title),
                                                                                  success: true)
                                                                            .distinct
                                                                            .order(:test_id)
                                                                            .pluck(:test_id)
      create_badge(:category_complete, category)
    end
  end

  def hard_tests_complete_badge
    if first_time_award?(:hard_tests_complete) &&
       Test.hard_lvls.order(:id).ids == user.test_passages.where(test: Test.hard_lvls, success: true)
                                                          .distinct.order(:test_id).pluck(:test_id)
      create_badge(:hard_tests_complete)
    end
  end

  private

  def create_badge(rule, badge_category = nil)
    user.badges.create(rule: rule, category: badge_category)
  end

  def first_time_award?(rule, badge_category = nil)
    Badge.where(rule: rule, user: user, category: badge_category).empty?
  end
end
