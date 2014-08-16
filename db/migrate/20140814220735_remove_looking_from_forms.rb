class RemoveLookingFromForms < ActiveRecord::Migration
  def change
    remove_column :forms, :looking
  end
end
