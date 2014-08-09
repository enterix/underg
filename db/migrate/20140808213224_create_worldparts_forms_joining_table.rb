class CreateWorldpartsFormsJoiningTable < ActiveRecord::Migration
  def change
    create_table :worldparts_forms do |t|
      t.belongs_to :worldparts
      t.belongs_to :forms
    end
  end
end
