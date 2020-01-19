module ProductImages
  class Pusher
    def initialize(params)
      @params = params
      @product_id =  @params[:product_id]
    end

    def create_a_product_image
      BigCommerce::Service.create_a_product_image(@product_id, @params)
    end
  end
end