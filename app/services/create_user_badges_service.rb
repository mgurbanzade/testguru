class CreateUserBadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
  end

  def call
    create_first_attempt_badge if first_attempt? && @test_passage.success?
    create_category_badge if category_completed?
    create_level_badge if level_completed?
  end

  private

  def create_first_attempt_badge
    @user.badges << Badge.find_by(rule: 'Первая Попытка')
  end

  def create_category_badge
    @user.badges << Badge.find_by(rule: 'Все Категории')
  end

  def create_level_badge
    @user.badges << Badge.find_by(rule: 'Все Уровни')
  end

  def first_attempt?
    @user.tests.where(id: @test.id).size <= 1
  end

  def category_completed?
    category_tests_size == succeed_category_tests_size
  end

  def level_completed?
    Test.where(level: @test.level).size == passed_level_tests_size
  end

  def category_tests_size
    Test.by_category_name(@test.category.title).size
  end

  def succeed_category_tests_size
    @user.succeed_by_category(@test.category.title).size
  end

  def passed_level_tests_size
    @user.passed_by_level(@test.level).uniq.size
  end
end
