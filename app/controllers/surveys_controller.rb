class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    
  end

  def showjson
    @survey = Survey.find_by(id: params[:id])
    render "showjson.json.jbuilder"
  end

  def create
  	@survey = Survey.new(user_params)
  	@survey.user_id = current_user.id
  	p "@survey"
  	p @survey.errors.messages
  	p @survey.valid?
  	p @survey
  	if request.xhr?
  		if @survey.save!
  			p "in request"
  			erb :"/surveys/_new_survey", layout: false, local: {survey: @survey}
  		else
  			p "in else of request"
  			erb :"surveys/_errors", layout: false, locals: {survey: @survey}
  		end
  	else
  		if @survey.save!
  			p "*************"
  			p params
  			redirect_to "/surveys/#{@survey.id}"
  		else
  			render "/surveys/new"
  		end
  	end
  end

  def show
  	@survey = Survey.find_by(id: params[:id])
  	@questions = Question.where("survey_id = ?", @survey.id)
  end


  private
  def user_params
    params.require(:survey).permit(:name, :creator_id)
  end


end