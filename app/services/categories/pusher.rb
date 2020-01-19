module Categories
  class Pusher

    def initialize(params)
      @params = params
    end

    def create_category
      BigCommerce::Service.create_category(@params)
    end

    def create_category_image
      category_id = @params[:category_id]
      params = { 'image_file' => @params[:image_file] }
      BigCommerce::Service.create_category_image(category_id, params)
    end
  end
end