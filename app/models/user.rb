class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'

  def passed_tests(level)
    Test.joins(:test_passages)
    .where(test_passages: { user_id: self.id }, level: level)
  end
end
