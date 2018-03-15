class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.sort_categories(category)
    Test.joins('join categories on categories.id = tests.category_id').
      where(categories: { title: category }).order('title DESC')
  end
end
