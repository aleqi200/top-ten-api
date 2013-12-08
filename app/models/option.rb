class Option < ActiveRecord::Base
  attr_accessible :title
  belongs_to :survey
end
