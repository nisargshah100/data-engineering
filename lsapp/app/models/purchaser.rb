class Purchaser < ActiveRecord::Base
  has_many :sales
  
  def to_s
    name
  end
end
