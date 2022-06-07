class MarketsController < ApplicationController
  #ログイン状態の場合のみ、商品出品ページへ遷移できるようにする。
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def market_params
      params.require(:market).permit(:content, :image, :item_name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
