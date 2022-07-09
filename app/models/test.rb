class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests

  class << self
    def all_titles_by_category_title(category_title)
      self.joins(:category).where(category: { title: category_title}).select(:title).order(title: :desc)
      # self.select(:title).where(category_id: Category.select(:id).where(title: category_title)).order(title: :desc)
    end
  end
end
