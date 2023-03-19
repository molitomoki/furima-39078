class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,               presence: true
  validates :email,                  presence: true
  validates :password,               presence: true
  validates :password_confirmation,  presence: true
  validates :last_name,              presence: true
  validates :first_name,             presence: true
  validates :last_name_reading,      presence: true
  validates :first_name_reading,     presence: true
  validates :birth_day,              presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  


end
