# fusion_factory_test

## General:

For saving time, I only use the Required Fields, and what this test needs to save into the database.

Big Commerce Client on lib/big_commerce/client.rb
Big Commerce Services on lib/big_commerce/service.rb

Categories, Products, ProductImages services are under /services
receiver.rb for get_all_records, get_a_record, and save on the database
pusher.rb for create a new record on Big Commerce

I didn't write the codes for update and removement, because they are similar ways.

## Notes
When get all datas from Big Commerce to local database
1. get all categories first
2. get all the products
3. get all the product_images

When create the data on Big Commerce, 
1. create a category first
2. create a product
3. create a product_image

Reasons: 
a product needs its categories exists first, 
and a product_images needs its product exists first.

Ruby version: 2.6.3
Rails version: 6.0.2.1
Database: PostgreSQL 9.6.15

If it needs, it can use sidekiq to handle the services and Cron time to schedule services

## Installation
1. install Ruby
2. install PostgreSQL
3. bundle install
4. rake db:create
5. rake db:migrate