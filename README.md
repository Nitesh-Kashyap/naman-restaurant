# naman-restaurant

* Ruby -v (3.0.0)
* Rails -v (7.0.3)

# Steps to Run the project

clone -  git clone https://github.com/Nitesh-Kashyap/naman-restaurant.git
cd naman-restaurant
bundle
rails db:setup
rails server

# Description

## Login module(customer)
* From GUI you can create a customer.
* confirm the account
* use the function test.
 
## Login module(admin)
* From GUI you can't create an admin.
* Using console you can create an admin
* confirm the account
* use the function test.

## Resturant model(customer)
* You dont have permission to add or delete any restaurant
* you dont have permission to add or delete any dish.
* you can review the dishes of restaurant.
* you can review the restaurant.

## Restaurant model(admin)
* You have permission to add or delete any restaurant
* you have permission to add or delete any dish.
* you can review the dishes of restaurant.
* you can review the restaurant.

## Dish model(customer)
* Dont have permission to add dish

## Dish model(admin)
* Have permission to add dishes.

## Gems used
* Devise - Authentication
* Mailer - Letter-opener

## Concepts used
* STI - Single table inheritance
* Polymorphic association
* Active jobs
* Action mailer

Thanks Happy learning.
