class User < ApplicationRecord
  has_and_belongs_to_many :tests, join_table: 'users_tests'

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end