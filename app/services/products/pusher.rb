module Products
  class Pusher
    def initialize(params)
      @params = params
    end

    def create_product
      BigCommerce::Service.create_product(@params)
    end

  end 
end