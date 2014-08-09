class RemoveWorldparts < ActiveRecord::Migration
  def change
    drop_table :worldparts_forms
    drop_table :worldparts
  end
end
