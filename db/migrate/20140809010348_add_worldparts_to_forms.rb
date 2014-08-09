class AddWorldpartsToForms < ActiveRecord::Migration
  def change
    change_table :forms do |t|
      t.boolean :europe
      t.boolean :australia
      t.boolean :asia
      t.boolean :north_america
      t.boolean :south_america
      t.boolean :africa
    end
  end
end
