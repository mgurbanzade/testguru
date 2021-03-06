class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }

  validates :timer, numericality: {
    only_integer: true, greater_than: 0
  }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (name) {
    joins(:category).where(categories: { title: name })
    .order(title: :desc)
  }

  def self.by_category_name(name)
    by_category(name).pluck(:title)
  end
end
