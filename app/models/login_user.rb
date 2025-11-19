class LoginUser < ApplicationRecord
  has_secure_password

  validates :login, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lvl, numericality: { only_integer: true }, allow_nil: true
end
