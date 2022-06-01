class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :notes
  has_many :comments
  has_many :likes
       
  validates :nickname, presence: true
         
  validates :birth_date, presence: true
       
  encrypted_password = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: encrypted_password, message: 'は無効です 英字と数字の両方を含めてください'
end
