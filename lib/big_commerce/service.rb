# frozen_string_literal: true

module BigCommerce
  class Service
    class << self
      PRODUCTS_PATH = '/catalog/products'
      CATEGORIES_PATH = '/catalog/categories'

      def list_products(params={})
        BigCommerce::Client.request('get', PRODUCTS_PATH, params)
      end

      def get_a_product(product_id, params={})
        path = File.join(PRODUCTS_PATH, product_id)
        BigCommerce::Client.request('get', path, params)
      end

      def create_product(params)
        BigCommerce::Client.request('post', PRODUCTS_PATH, params)
      end

      def list_categories(params)
        BigCommerce::Client.request('get', CATEGORIES_PATH, params)
      end

      def get_a_category(category_id, params={})
        path = File.join(CATEGORIES_PATH, category_id)
        BigCommerce::Client.request('get', path, params)
      end

      def create_category(params)
        BigCommerce::Client.request('post', CATEGORIES_PATH, params)
      end

      def create_category_image(category_id, params)
        path = File.join(CATEGORIES_PATH, category_id)
        BigCommerce::Client.request('post', path, params)
      end

      def get_all_product_images(product_id, params={})
        path = File.join(PRODUCTS_PATH, product_id, 'images')
        BigCommerce::Client.request('get', path, params)
      end


    
    end
  end
end