class User < ApplicationRecord

  def passed_tests(level)
    Test.joins('join test_passages on tests.id = test_passages.test_id')
      .where('test_passages.user_id = ? and tests.level = ?', self.id, level)
  end
end
