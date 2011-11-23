class UploadsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
  end

  def create
    csv = params[:upload]
    if csv.nil?
      flash.now[:alert] = 'You must select a file'
      render :new
    else
      @revenue = process_csv_file(csv)
      render :show
    end
  end
  
  private 
  
  # Processes the csv and returns the revenue
  def process_csv_file(csv)
    revenue = 0
    
    begin
      FasterCSV.parse csv.read, :col_sep => "\t", :headers => true do |row|
        purchaser = Purchaser.find_or_create_by_name row[0]
        merchant = Merchant.find_or_create_by_name row[5], :address => row[4]
        deal = Deal.find_or_create_by_description row[1], :price => row[2]
        sale = Sale.create :purchaser => purchaser, :merchant => merchant, :deal => deal, :purchase_count => row[3]
        
        revenue += deal.price * sale.purchase_count 
      end
    rescue FasterCSV::MalformedCSVError 
      # log it 
    end
    
    revenue
  end

end
