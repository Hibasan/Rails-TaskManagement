class User < ApplicationRecord
  validates :name ,presence: true
  validates :email ,presence: true
  validates :password ,presence: true
  has_many :tasks, dependent: :destroy
  has_secure_password
end
