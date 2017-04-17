class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :line_items, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  validate :no_price, if: :price

  def reviewed?
    reviews.count > 0
  end

  def average_rating
    reviews.inject(0) { |previous, reviews | reviews.rating + previous}.to_f / reviews.count
  end

  private

  def no_price
    errors.add(:price, "Can't sell it if it's free!") if price > 0
  end
end
