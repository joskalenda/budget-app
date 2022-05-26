class Category < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy
  has_many :entities, through: :category_entities, dependent: :destroy
  has_one_attached :image

  def total_amount
    # entities.sum('amount')
  end

  def recent_transactions
    # entities.order(created_at: :desc)
  end
end
