class User < ApplicationRecord
  has_many :links

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  validates_uniqueness_of :email
end
