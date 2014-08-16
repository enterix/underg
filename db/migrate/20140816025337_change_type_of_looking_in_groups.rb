class ChangeTypeOfLookingInGroups < ActiveRecord::Migration
  def change
    change_column :groups, :looking, :boolean
  end
end
