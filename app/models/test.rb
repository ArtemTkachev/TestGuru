class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests
  scope :all_titles_by_category_title,
        ->(category_title) { joins(:category).where(category: { title: category_title}).select(:title).order(title: :desc) }
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0}
end
