class BadgeService

  def initialize(test_passage)
  @test_passage = test_passage
  @user = test_passage.user
  @test = test_passage.test
  select_bage
  end

  def select_bage
    Badge.all.each { |badge| send("#{badge.rule}", badge) }
  end

  private

  def seccess_from_first_attempt(badge)
    if TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1
      UserBadge.new(user: @user, badge: badge)
    end
  end

  def resolved_all_from_category(badge)
    category = @test.category
    if @user.tests.by_category(category).uniq.count == Test.by_category(category).count
      UserBadge.new(user: @user, badge: badge)
    end
  end

  def resolvad_all_in_level(badge)
    level = @test.level
    if @user.tests.find_by(level: level)uniq.count == Test.find_by(level: level).count
    UserBadge.new(user: @user, badge: badge)
    end
  end



end


