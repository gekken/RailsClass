class Purchase < ActiveRecord::Base
    attr_accessible :name, :cost
  validates :name, :presence => true
  validates :cost, :numericality => {:greater_than => 0}
end
