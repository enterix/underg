class ChangeForms < ActiveRecord::Migration
  def change
    remove_reference :forms, :game, index: true
    remove_reference :forms, :user, index: true

    add_reference :forms, :game, index: true, unique: true
    add_reference :forms, :user, index: true, unique: true
  end
end