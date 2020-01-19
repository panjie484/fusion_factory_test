module ProductImages
  class Receiver
    def initialize(params)
      @params = params
      @product_id =  @params[:product_id]
    end

    def get_all_product_images
      @images = BigCommerce::Service.get_all_product_images(@product_id, @params)     
    end

    def convert_images(data)
      @images_data = []
      data[:data].each do |row|
        @images_data << {
          id: row[:id],
          product_id: row[:product_id],
          image_url: row[:url_standard]
        }
      end
    end

    def save_all_product_images
      get_all_product_images
      convert_images(@images)
      ProductImage.import @images_data
    end
  end
end