module Awards
  def first_try_badge
    if TestPassage.where(user: user, test: test).size == 1
      user.badges.create(awarded_for: :first_try)
    end
  end

  def category_programming_complete_badge
    if Test.by_category("Programming").size == select_succeeded_passes
                                               .select {|t| t.test.category.title == "Programming"}
                                               .size
      user.badges.create(awarded_for: :category_programming_complete)
    end
  end

  # def hard_tests_complete_badge
  #   if Test.hard_lvls.size == select_succeeded_passes.select {|t| t.test.level == 5..Float::INFINITY}
  #     user.badges.create(awarded_for: :hard_tests_complete)
  #   end
  User.last.test_passages.distinct(:test_id).where(test: Test.hard_lvls).select(&:success?)
  # end

  private

  def select_succeeded_passes
    user.test_passages.uniq(&:test_id).select(&:success?)
  end
  #user.test_passages.select("distinct test_id").where(test: Test.hard_lvls).select(&:success?)
end
