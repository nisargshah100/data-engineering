class Sale < ActiveRecord::Base
  belongs_to :deal
  belongs_to :merchant
  belongs_to :purchaser
  
  def to_s
    "#{merchant} | #{purchaser} | #{deal} | Count: #{purchase_count}"
  end
  
end
