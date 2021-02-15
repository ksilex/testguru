module Awards
  def first_try_badge
    if TestPassage.where(user: user, test: test).size == 1
      user.badges.create(awarded_for: :first_try)
    end
  end

  def category_programming_complete_badge
    if first_time?(:category_programming_complete) &&
       Test.by_category("Programming").ids.sort == user.test_passages
                                                       .where(test: Test.by_category("Programming"))
                                                       .select(&:success?)
                                                       .pluck(:test_id).sort.uniq
      user.badges.create(awarded_for: :category_programming_complete)
    end
  end

  def hard_tests_complete_badge
    if first_time?(:hard_tests_complete) &&
       Test.hard_lvls.ids.sort == user.test_passages.where(test: Test.hard_lvls)
                                                    .select(&:success?)
                                                    .pluck(:test_id).sort.uniq

      user.badges.create(awarded_for: :hard_tests_complete)
    end
  end

  private

  def first_time?(award)
    Badge.where(awarded_for: award, user: user).empty?
  end
  #user.test_passages.select("distinct test_id").where(test: Test.hard_lvls).select(&:success?)
end
