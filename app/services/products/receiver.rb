module Products
  class Receiver

    def initialize(params)
      @params = params
    end

    def get_all_products
      @all = BigCommerce::Service.list_products(@params)
    end

    def get_a_product
      products_id = @params[:products_id]
      @product = BigCommerce::Service.get_a_product(products_id, @params)
    end

    # assume #get_a_product method should return json data like this, 
    # I use this fake data for test, because this test is based on Big commerce API document, not real API
    # Normally, I should use this example on Rspec, but in this test, I use here for saving time.
    # It can be ignored
    def a_fake_product
      @a_fake_product = {
        "data": {
          "id": 174,
          "name": "1L Le Parfait Jar",
          "type": "physical",
          "sku": "",
          "description": "<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vel metus ac est egestas porta sed quis erat. Integer id nulla massa. Proin vitae enim nisi. Praesent non dignissim nulla. Nulla mattis id massa ac pharetra. Mauris et nisi in dolor aliquam sodales. Aliquam dui nisl, dictum quis leo sit amet, rutrum volutpat metus. Curabitur libero nunc, interdum ac libero non, tristique porttitor metus. Ut non dignissim lorem, in vestibulum leo. Vivamus sodales quis turpis eget.</span></p>",
          "weight": 1,
          "width": 0,
          "depth": 0,
          "height": 0,
          "price": 7.95,
          "cost_price": 0,
          "retail_price": 10,
          "sale_price": 0,
          "map_price": 0,
          "tax_class_id": 0,
          "product_tax_code": "",
          "calculated_price": 7.95,
          "categories": [
            23,
            21
          ],
          "brand_id": 36,
          "option_set_id": {},
          "option_set_display": "right",
          "inventory_level": 0,
          "inventory_warning_level": 0,
          "inventory_tracking": "none",
          "reviews_rating_sum": 0,
          "reviews_count": 0,
          "total_sold": 7,
          "fixed_cost_shipping_price": 0,
          "is_free_shipping": false,
          "is_visible": true,
          "is_featured": false,
          "related_products": [
            -1
          ],
          "warranty": "",
          "bin_picking_number": "",
          "layout_file": "product.html",
          "upc": "",
          "mpn": "",
          "gtin": "",
          "search_keywords": "jar, glass",
          "availability": "available",
          "availability_description": "",
          "gift_wrapping_options_type": "any",
          "gift_wrapping_options_list": [],
          "sort_order": 0,
          "condition": "New",
          "is_condition_shown": false,
          "order_quantity_minimum": 0,
          "order_quantity_maximum": 0,
          "page_title": "",
          "meta_keywords": [],
          "meta_description": "",
          "date_created": "2018-08-15T14:48:46+00:00",
          "date_modified": "2018-09-05T20:42:07+00:00",
          "view_count": 10,
          "preorder_release_date": {},
          "preorder_message": "",
          "is_preorder_only": false,
          "is_price_hidden": false,
          "price_hidden_label": "",
          "custom_url": {
            "url": "/all/1l-le-parfait-jar/",
            "is_customized": true
          },
          "base_variant_id": 345,
          "open_graph_type": "product",
          "open_graph_title": "",
          "open_graph_description": "",
          "open_graph_use_meta_description": true,
          "open_graph_use_product_name": true,
          "open_graph_use_image": true
        },
        "meta": {}
      }
    end

    def convert_array(data)
      @products_data = []
      @product_categories_data = []
      data[:data].each do |row|
        @products_data <<  {
          id: row[:id],
          name: row[:name],
          product_type: row[:type],
          weight: row[:weight],
          price: row[:price]
        }

        row[:categories].each do |category_id|
          @product_categories_data << {
            product_id: row[:id],
            category_id: category_id
          }
        end
      end
    end

    def convert_hash(data)
      @product_data = { 
        id: data[:data][:id],
        name: data[:data][:name],
        product_type: data[:data][:type],
        weight: data[:data][:weight],
        price: data[:data][:price]
      }
      @category_ids = data[:data][:categories]
    end

    def save_all_products
      get_all_products
      convert_array(@all)
      Product.import @products_data
      ProductCategory.import @product_categories_data
    end

    def save_a_product
      get_a_product
      convert_hash(@product)
      product = Product.create @product_data
      @category_ids.each do |category_id|
        product.product_categories.create!(category_id: category_id)
      end
    end
  end
end