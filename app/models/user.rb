class User < ActiveRecord::Base
  has_many :forms
  has_many :games, through: :forms
  has_and_belongs_to_many :languages

  validates :nickname, presence: true, length: { minimum: 5, maximum: 20 },
            format: { with: /\A[a-zA-Z0-9]+\z/, message: I18n.t('errors.messages.only_letters_and_digits')}
  validate :isNickNameAvaliable
  validates :password, confirmation: true, length: { minimum: 6, maximum: 30 }
  validate :passwordNotEqualToNickname
  validates :password_confirmation, presence: true
  validates :email, email_format: {message: I18n.t('errors.messages.incorrect_male')}
  validate :isEmailAvaliable
  validates_date  :date_of_birth, :before => Time.now
  validates_inclusion_of :sex, :in => [true, false], presence: true
  validate :existLangs
  validate :langsNotEqueal

  private
  def passwordNotEqualToNickname
    errors.add(:password, I18n.t('errors.messages.should_be_different_with_nickname')) if nickname == password
  end

  def existLangs()
      errors.add(:language, I18n.t('errors.messages.present')) if self.languages.empty?
  end

  def langsNotEqueal()
    errors.add(:language, I18n.t('errors.messages.should_be_different_with_others_langs')) if (self.languages[0] == self.languages[1] &&
        self.languages[2] != nil) ||
          (self.languages[0] == self.languages[2] && self.languages[2] != nil) ||
          (self.languages[2] == self.languages[1] && self.languages[2] != nil)
  end

  def isNickNameAvaliable
    errors.add(:nickname, I18n.t('errors.messages.is_using')) if User.where(nickname: nickname).first
  end

  def isEmailAvaliable
    errors.add(:email, I18n.t('errors.messages.is_using')) if User.where(email: email).first
  end
end