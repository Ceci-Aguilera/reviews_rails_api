# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Models

### Category
- title
- has_many :technology_categories
- has_many :technologies, through: :technology_categories

### Technology
- title
- score: float
- image_url
- slug
- has_many :technology_categories
- has_many :categories, through: :technology_categories
- has_many: reviews
- amount

### Technology-Categories
- belongs_to: category
- belongs_to: technology

### Review
- title
- description
- score: integer
- belongs_to: technologies, user

### User
- devise User
- has_many: reviews
