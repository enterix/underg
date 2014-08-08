class Game < ActiveRecord::Base
  has_many :forms
  has_many :users, through: :forms

end
