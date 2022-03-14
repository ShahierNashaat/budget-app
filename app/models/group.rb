class Group < ApplicationRecord
  belongs_to :user
  has_many :payment_groups

  validates :name, :icon, presence: true
end
