class CreateLanguagesFormsJoiningTable < ActiveRecord::Migration
  def change
    create_table :languages_forms do |t|
      t.belongs_to :language
      t.belongs_to :form
    end
  end
end
