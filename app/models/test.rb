class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users, join_table: 'users_tests'

  class << self
    def all_titles_by_category_title(category_title)
      self.select(:title).where(category_id: Category.select(:id).where(title: category_title)).order(title: :desc)
    end
  end
end
