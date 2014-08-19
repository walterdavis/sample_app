class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, :unique
  end
end
