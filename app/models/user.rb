class User < ActiveRecord::Base
  validates :nickname, presence: true, length: { minimum: 5, maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: I18n.t('errors.messages.only_letters_and_digits')}
  validate :isNickNameAvaliable
  validates :password, confirmation: true, length: { minimum: 6, maximum: 30 }
  validate :passwordNotEqualToNickname
  validates :password_confirmation, presence: true
  validates :email, email_format: {message: I18n.t('errors.messages.incorrect_male')}
  validate :isEmailAvaliable
  validates_date  :date_of_birth, :before => Time.now

  private
  def passwordNotEqualToNickname
    errors.add(:password, I18n.t('errors.messages.should_be_different_with_nickname')) if nickname == password
  end

  def isNickNameAvaliable
    errors.add(:nickname, I18n.t('errors.messages.is_using')) if User.where(nickname: nickname).first
  end

  def isEmailAvaliable
    errors.add(:email, I18n.t('errors.messages.is_using')) if User.where(email: email).first
  end
end