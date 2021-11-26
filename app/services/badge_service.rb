class BadgeService

  def initialize(test_passage)
  @test_passage = test_passage
  @user = test_passage.user
  @test = test_passage.test
  select_badge
  end

  def select_badge
    Badge.all.each do |badge|
      user.badges << badge if send("#{badge.rule}")
    end
  end

  private

  def success_from_first_attempt
   TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1
  end

  def resolved_all_from_category
    category = @test.category.title
     @user.tests.by_category(category).uniq.count == Test.by_category(category).count
  end

  def resolved_all_in_level
    tests_in_list = Test.where(level: @test.level).pluck(:id)
    tests_seccess_the_same_level = @user.test_passages.where(result: true, test: tests_in_list).pluck(:test_id).uniq
   tests_in_list.count == tests_seccess_the_same_level.count
  end
  
end


