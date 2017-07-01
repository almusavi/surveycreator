class SurveysController < ApplicationController
  def index
    @questions = Questions.all
  end

  def new
    @survey = Survey.find_by(id: params[:survey_id])
    
  end

  def create
  	@question = Question.new(user_params)
  	@question.survey_id = current_user.id
  	if request.xhr?
  		if @question.save!
  			erb :"/surveys/_new_survey", layout: false, local: {survey: @survey}
  		else
  			erb :"surveys/_errors", layout: false, locals: {survey: @survey}
  		end
  	else
  		if @question.save!
  			redirect_to "/question/#{@question.id}"
  		else
  			render "/surveys/new"
  		end
  	end
  end

  def show
  	@survey = Survey.find_by(id: params[:id])
  	@answers = Answer.find_by(survey_id: @survey.id)
  end


  private
  def user_params
    params.require(:survey).permit(:name, :creator_id)
  end


end