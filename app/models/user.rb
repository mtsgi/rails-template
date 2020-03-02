class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { minimum: 0, maximum: 20 }
  validates :email, presence: true
  validates :password, presence: { on: :create }, confirmation: { allow_blank: true }
end
