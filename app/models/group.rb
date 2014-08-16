class Group < ActiveRecord::Base
  has_many :forms

  validates :count, presence: true, numericality: {only_integer: true, greater_than: 1, less_than_or_equal_to: 5}
end
