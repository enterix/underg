class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :count

      t.timestamps
    end
  end
end
