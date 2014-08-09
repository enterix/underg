class RemoveLanguageForms < ActiveRecord::Migration
  def change
    drop_table :languages_forms
  end
end
