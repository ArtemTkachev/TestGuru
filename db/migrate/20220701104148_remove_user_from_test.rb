class RemoveUserFromTest < ActiveRecord::Migration[6.1]
  def change
    remove_column(:tests, :user_id)
  end
end
