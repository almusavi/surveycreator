class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    
  end

  def create
  	@survey = Survey.new(creator_id: params[:user_id], name: params[:surveyquestion])
  	if request.xhr?
  		if @survey.save
  			erb :"/surveys/_new_survey", layout: false, local: {survey: @survey}
  		else
  			erb :"surveys/_errors", layout: false, locals: {survey: @survey}
  		end
  	else
  		if @survey.save
  			redirect "/surveys/#{@survey.id}"
  		else
  			render "/surveys/new"
  		end
  	end
  end


end