class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name, :introduction
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999}
    validates :image, blob: { content_type: :image }
  end
  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :delivery_time_id, numericality: {other_than: 0, message: "Can't be blank"}
end
