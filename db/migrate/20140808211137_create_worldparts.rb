class CreateWorldparts < ActiveRecord::Migration
  def change
    create_table :worldparts do |t|
      t.string :name

      t.timestamps
    end
  end
end
