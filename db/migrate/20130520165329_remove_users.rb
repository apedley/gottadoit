class RemoveUsers < ActiveRecord::Migration
  def up
    drop_table :users
    remove_column :tasks, :user_id
  end

  def down
  end
end
