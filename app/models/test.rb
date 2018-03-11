class Test < ApplicationRecord
  def self.sort_categories(category)
    Test.joins('join categories on categories.id = tests.category_id').
      where(categories: { title: category }).order('title DESC')
  end
end
