class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items, dependent: :destroy

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  validates :total_cents, presence: true, numericality: {greater_than: 0}
  
end
