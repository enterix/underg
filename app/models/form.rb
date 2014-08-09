class Form < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :age_from, presence: true, numericality: { :greater_than_or_equal_to => -1, :less_than_or_equal_to => :age_upto }
  validates :age_upto, presence: true, numericality: { :greater_than_or_equal_to => :age_from, :less_than_or_equal_to => 100 }
  validate :atLeastOneWorldpart

  private
  def atLeastOneWorldpart
    errors.add(I18n.t('activerecord.attributes.user.worldparts'), I18n.t('views.messages.at_least_one_worldpart')) if europe != true && australia != true &&
                                                                                            asia != true && africa != true &&
                                                                                            north_america != true && south_america != true
  end
end