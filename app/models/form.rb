class Form < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :group

  validates_date :age_upto, on_or_after: lambda {self.age_from}
  validates :age_upto, presence: true
  validates_date :age_from, on_or_before: lambda {self.age_upto}
  validates :age_from, presence: true
  validate :atLeastOneWorldpart

  private
  def atLeastOneWorldpart
    errors.add(I18n.t('activerecord.attributes.form.worldparts'),
               I18n.t('views.messages.at_least_one_worldpart')) if europe != true &&
                                             australia != true &&
                                             asia != true &&
                                             africa != true &&
                                             north_america != true &&
                                             south_america != true
  end
end