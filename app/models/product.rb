class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, :price, :quantity, :category, presence: true

  def stock_out?
    quantity == 0
  end

end
