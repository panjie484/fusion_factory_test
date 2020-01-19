# frozen_string_literal: true

require 'big_commerce/client'
require 'big_commerce/service'

BigCommerce::Client.configure(
  base_url: File.join(ENV.fetch('BC_HOST'), 'stores', ENV.fetch('STORE_HASH'), 'v3'), 
  x_auth_client: ENV.fetch('X_AUTH_CLIENT'), 
  x_auth_token: ENV.fetch('X_AUTH_TOKEN')
)