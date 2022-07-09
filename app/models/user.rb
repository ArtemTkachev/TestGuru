class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :author_tests, class_name: 'Test', inverse_of: 'author', foreign_key: :author_id

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
