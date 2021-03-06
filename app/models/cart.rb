class Cart < ApplicationRecord
  # 關聯 #
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  # 加入購物車 #
  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    ci.save
  end

  # 購物車總價 #
  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end

end
