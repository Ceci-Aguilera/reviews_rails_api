class Category < ApplicationRecord
  has_many :technology_categories
  has_many :technologies, through: :technology_categories
end
