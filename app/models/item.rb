class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :scheduled_delivery

  validates :name, :info, :price, presence: true

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, numericality: { in: 300..9,999,999 , message: "is out of setting range"}
  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }


  
end
