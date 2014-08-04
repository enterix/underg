class AddEmailAndDateOfBirthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :date_of_birth, :date
  end
end
