class Category < ActiveRecord::Base

  has_many :products
  validates :name, presence: true

  def products_by_category(id)
    Product.where("category_id = ?", id).count
  end

end
