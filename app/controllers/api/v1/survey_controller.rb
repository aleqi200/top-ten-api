class Api::V1::SurveyController < ApplicationController
	def index
	    @surveys = Survey.all
	    render json: @surveys.to_json(:include => :options)
	end

	def show
	    @survey = Survey.find(params[:id])
	    render json: @survey.to_json(:include => :options)
	end

	def create
		@survey = Survey.new(params[:survey])
		puts @survey.title
		render json: @survey.to_json(:include => :options), status: 201
	end
	def update
    	@survey = Survey.find(params[:id]).to_json(:include => :options)
	end

	def destroy
	    @survey = Survey.find(params[:id])
	    @survey.destroy

	    respond_to do |format|
          format.json { head :no_content }
    	end
  end
  
  private
  
end
