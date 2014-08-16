class AddLookingToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :looking, :integer
  end
end
