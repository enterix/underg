class CreateWorldParts < ActiveRecord::Migration
  def change
    create_table :world_parts do |t|
      t.string :name

      t.timestamps
    end
  end
end
