class DropFounds < ActiveRecord::Migration
  def change
    drop_table :founds
  end
end
