class Entity < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
  has_many :categories through: :category_entities, dependent: :destroy

end
