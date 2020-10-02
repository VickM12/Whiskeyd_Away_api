class User < ApplicationRecord
  has_secure_password
  has_many :ledgers
  has_many :whiskeys, through: :ledgers
end
