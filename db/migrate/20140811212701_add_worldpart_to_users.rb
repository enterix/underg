class AddWorldpartToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :worldpart
    end
  end
end
