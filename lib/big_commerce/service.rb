# frozen_string_literal: true

module BigCommerce
  class Service
    class << self
      PRODUCTS_PATH = '/catalog/products'
      CATEGORIES_PATH = '/catalog/categories'

      def list_products(params=nil)
        BigCommerce::Client.request('get', PRODUCTS_PATH, params)
      end

      def create_product(params)
        BigCommerce::Client.request('post', PRODUCTS_PATH, params)
      end

      def list_categories(params=nil)
        BigCommerce::Client.request('get', CATEGORIES_PATH, params)
      end

      def create_category(params)
        BigCommerce::Client.request('post', CATEGORIES_PATH, params)
      end


    
    end
  end
end