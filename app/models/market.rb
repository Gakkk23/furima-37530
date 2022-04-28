class Market < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #ActiveHash
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :shipping_date

  #ActiveStorage
  has_one_attached :image

  
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
    validates :image
    validates :user_id
  end

  with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
    validates :price
  end
  
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :shipping_date_id
  end

end
