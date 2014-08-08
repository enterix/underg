class DropUsersFormsTeble < ActiveRecord::Migration
  def change
    drop_table :users_forms
  end
end
