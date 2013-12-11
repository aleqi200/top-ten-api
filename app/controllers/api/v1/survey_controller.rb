class Api::V1::SurveyController < ApplicationController
	def index
	    @surveys = Survey.all
	    render :json => @surveys
	end

	def show
	    @survey = Survey.find(params[:id])
	    render :json => @survey
	end

	def create
		@survey = Survey.new(attributify(:survey))
		if @survey.save
			render :json => @survey
		end
	end
	def update
    	@survey = Survey.find(params[:id])
    	if @survey.update_attributes(attributify(:survey))
    		render :json => @survey
    	end
	end

	def destroy
	    @survey = Survey.find(params[:id])
	    @survey.destroy

	    respond_to do |format|
          format.json { head :no_content }
    	end
  end
end
