class AddBelongsToGroupToForms < ActiveRecord::Migration
  def change
    add_belongs_to :forms, :group, index: true
  end
end