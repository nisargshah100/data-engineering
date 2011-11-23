class HomeController < ApplicationController
  
  def index
    if current_user
      @deals = Deal.all
      @merchants = Merchant.all
      @purchasers = Purchaser.all
      @sales = Sale.all
    end
  end

end
