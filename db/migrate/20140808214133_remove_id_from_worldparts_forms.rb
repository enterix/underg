class RemoveIdFromWorldpartsForms < ActiveRecord::Migration
  def change
    remove_column :worldparts_forms, :id
  end
end
