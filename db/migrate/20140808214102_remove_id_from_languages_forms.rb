class RemoveIdFromLanguagesForms < ActiveRecord::Migration
  def change
    remove_column :languages_forms, :id
  end
end
