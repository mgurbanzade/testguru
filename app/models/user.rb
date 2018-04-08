class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  CORRECT_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :feedbacks

  validates :email, format: CORRECT_EMAIL_FORMAT, uniqueness: true
  validates :password, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def passed_by_level(level)
    tests.where(level: level)
  end

  def admin?
    self.is_a?(Admin)
  end
end
