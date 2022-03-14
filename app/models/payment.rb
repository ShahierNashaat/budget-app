class Payment < ApplicationRecord
  belongs_to :user
  has_many :payment_groups

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
