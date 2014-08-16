class AddLookingToForms < ActiveRecord::Migration
  def change
    add_column :forms, :looking, :boolean, default: false
  end
end
