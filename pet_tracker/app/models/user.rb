class User < ActiveRecord::Base
  has_many :pets
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  validates :lastname, presence: true
  validates :birthday, presence: true 
  validates :email, presence: true, uniqueness: true 
end
