class RemoveTestFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column(:users, :test_id)
  end
end
