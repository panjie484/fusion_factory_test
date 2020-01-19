module Categories
  class Receiver
    def initialize(params)
      @params = params
    end

    def get_all_categories
      @all = BigCommerce::Service.list_categories(@params)
    end

    def get_a_category
      category_id = @params[:category_id]
      @category = BigCommerce::Service.get_a_category(category_id, @params)
    end

    # assume #get_a_category method should return json data like this, 
    # I use this fake data for test, because this test is based on Big commerce API document, not real API
    # Normally, I should use this example on Rspec, but in this test, I use here for saving time.
    # It can be ignored
    def a_fake_category
       @a_fake_category= {
        "data": {
          "id": 19,
          "parent_id": 0,
          "name": "Garden",
          "description": "<p>This is the garden description</p>",
          "views": 0,
          "sort_order": 2,
          "page_title": "page title",
          "meta_keywords": [
            "meta keyword"
          ],
          "meta_description": "meta description",
          "layout_file": "category.html",
          "image_url": "",
          "is_visible": true,
          "search_keywords": "search keywords",
          "default_product_sort": "use_store_settings",
          "custom_url": {
            "url": "/garden/",
            "is_customized": false
          }
        }
      }
    end

    def convert_array(data)
      @categories_data = []
      data[:data].each do |row|
        @categories_data <<  {
          id: row[:id],
          name: row[:name],
          parent_id: row[:parent_id],
          image_url: row[:image_url]
        }
      end
    end

    def convert_hash(data)
      @category_data = { 
        id: data[:data][:id],
        name: data[:data][:name],
        parent_id: data[:data][:parent_id],
        image_url: data[:data][:image_url]
      }
    end

    def save_all_categories
      get_all_categories
      convert_array(@all)
      Category.import @categories_data
    end

    def save_a_category
      get_a_category
      convert_hash(@category)
      Category.create! @category_data
    end

  end
end