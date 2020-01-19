class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  validates :name, :product_type, :weight, :price, presence: true
end
