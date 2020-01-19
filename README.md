# fusion_factory_test

For saving time, I only use the Required Fields, Read-Only Fields and what these test needs to save on the database

Products:
Required Fields:
name
type
weight
categories
images

Read-Only Fields
id
date_created
date_modified
calculated_price

Category:
Required Fields:

parent_id:
Creating a child category set the parent_id to the parent category
If create a top level category set the parent_id to 0.

image_url

name
Read-Only Fields:
id