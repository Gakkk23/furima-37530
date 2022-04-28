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

  
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :shipping_date_id
  end

end
