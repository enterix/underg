class User < ActiveRecord::Base
  validates :nickname, presence: true, length: { minimum: 5, maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only letters"}
  validate :isNickNameAvaliable
  validates :password, confirmation: true, length: { minimum: 6, maximum: 30 }
  validate :passwordNotEqualToNickname
  validates :password_confirmation, presence: true
  validates :email, email_format: {message: "has wrong format"}
  validate :isEmailAvaliable

  private
  def passwordNotEqualToNickname
    errors.add(:password, "can't be the same as nickname") if nickname == password
  end

  def isNickNameAvaliable
    errors.add(:nickname, "is not avaliable") if User.where(nickname: nickname).first
  end

  def isEmailAvaliable
    errors.add(:email, "is not avaliable") if User.where(email: email).first
  end
end