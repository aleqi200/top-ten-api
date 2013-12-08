class Survey < ActiveRecord::Base
   attr_accessible :title, :end_date, :end_qty, :description,:style, :options
   has_many :options, :dependent => :destroy
   accepts_nested_attributes_for :options, :allow_destroy => true
end
