class MarketsController < ApplicationController

  private

  def market_params
      params.require(:market).permit(:content, :image).merge(user_id: current_user.id)
  end
end
