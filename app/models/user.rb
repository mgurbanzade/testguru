class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'

  def passed_tests(level)
    Test.joins('join test_passages on tests.id = test_passages.test_id')
      .where('test_passages.user_id = ? and tests.level = ?', self.id, level)
  end
end
