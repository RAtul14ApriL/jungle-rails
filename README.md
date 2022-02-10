# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. This app is developed by Md. Hefzul (Ratul) Bari (https://github.com/RAtul14ApriL) as a requirement of Lighthouse Labs Web Development Bootcamp November 2021 West Cohort. This is a Ruby on Rails web app with postgresql database, tested with RSpec, Capybara and Poltergeist.

## Functionalities

Users can see all the products in the homepage. They can see product details by clicking Details button in each product block. They can also add a product to cart with add-to-cart button. A Sold out badge is displayed on the out of stock products.

User does not have to be registered or logged in to view, add products to cart, place order and checkout. However, user can register and/login as well. User will be forwarded to the signup or login form by Signup and Login button beneath the Top Nav menu. A user can register with First Name, Last Name, Email and Password. If user's email is already register, it will throw error. If any mendatory field is blank, it will throw error. If the password is less than 8 characters, it will throw error. Registered user can login with their email and password.

Jungle also include features for admin. To access the admin pages, admin must logged in using username and password (through HTTP_Basic_Authentication). Admin can create and delete a product and category.

## Setup

1. Clone the [Jungle Rails](https://github.com/RAtul14ApriL/jungle-rails) repo.
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
10. The app will run in localhost [Port: 3000](http://localhost:3000/)

## Stripe Testing for Checkout

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Ruby 2.3.5 (for Linux, WSL), 2.6.6 (for M1)
* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

* 