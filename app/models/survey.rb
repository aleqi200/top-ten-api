class Survey < ActiveRecord::Base
   validates :title, presence: true
   validates :end_qty_votes, numericality: { only_integer: true }, :allow_nil => true
   attr_accessible :title, :end_date, :end_qty, :description,:style, :options_attributes
   has_many :options, :dependent => :destroy
   accepts_nested_attributes_for :options, :allow_destroy => true

   def as_json(options={})
   	super(:include => [:options => {:only => [:title, :id]}])
   end
end
