class HealthController < ApplicationController
  def index
  	@health = {:status => 'ok'}
  	respond_to do |format|
    	format.json { render json: @health }
	    format.xml { render xml: @health }
	end
  end
end
