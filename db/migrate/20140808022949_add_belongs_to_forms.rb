class AddBelongsToForms < ActiveRecord::Migration
  def change
    add_reference :forms, :game, index: true
    add_reference :forms, :user, index: true
  end
end
