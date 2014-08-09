class ChangeFormsAgeFromAnfAgeUpto < ActiveRecord::Migration
  def change
    change_column :forms, :age_from, :integer
    change_column :forms, :age_upto, :integer
  end
end
