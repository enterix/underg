class CreateFounds < ActiveRecord::Migration
  def change
    create_table :founds do |t|
      t.belongs_to :form
      t.belongs_to :form
    end
  end
end
