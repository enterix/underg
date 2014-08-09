class RemoveWorldParts < ActiveRecord::Migration
  def change
    drop_table :world_parts
  end
end
