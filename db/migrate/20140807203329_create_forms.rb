class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.date :age_from
      t.date :age_upto

      t.timestamps
    end
    create_table :users_forms, id: false do |t|
      t.belongs_to :form, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
