class UserChangeDateType < ActiveRecord::Migration
  def change
    change_column :users, :date_of_birth, :date
    change_column :forms, :age_from, :date
    change_column :forms, :age_upto, :date
  end
end
