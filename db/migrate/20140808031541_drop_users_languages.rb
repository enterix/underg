class DropUsersLanguages < ActiveRecord::Migration
  def change
    drop_table :users_languages
  end
end
