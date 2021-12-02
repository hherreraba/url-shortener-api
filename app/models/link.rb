class Link < ApplicationRecord
  belongs_to :user
  has_many :visit_statistics
end
