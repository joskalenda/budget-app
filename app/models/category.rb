class Category < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy
  has_many :entities :through :category_entities, dependent: :destroy
end
