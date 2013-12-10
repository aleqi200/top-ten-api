class Option < ActiveRecord::Base
  attr_accessible :title
  belongs_to :survey

  def as_json(options={})
  	super(:only => [:title, :id])
  end
end
