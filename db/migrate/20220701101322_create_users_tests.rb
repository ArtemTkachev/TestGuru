class CreateUsersTests < ActiveRecord::Migration[6.1]
  def change
    create_table :users_tests do |t|
      t.references :user
      t.references :test
      t.timestamps
    end
  end
end
