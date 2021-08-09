class Technology < ApplicationRecord
  has_many :technology_categories
  has_many :categories, through: :technology_categories
end
