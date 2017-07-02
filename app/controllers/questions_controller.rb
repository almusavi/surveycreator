class QuestionsController < ApplicationController
  def index
    @questions = Questions.all
  end

  def new
    @survey = Survey.find_by(id: params[:survey_id])
    
  end

  def create
    @survey = Survey.find_by(id: params[:survey_id])
  	@question = Question.new(user_params)
  	# @question.survey_id = current_user.id
    @question.survey_id = @survey.id

  	if request.xhr?
  		if @question.save!
  			erb :"/surveys/_new_survey", layout: false, local: {survey: @survey}
  		else
  			erb :"surveys/_errors", layout: false, locals: {survey: @survey}
  		end
  	else
  		if @question.save!
  			redirect_to "/surveys/#{@question.survey_id}/questions/#{@question.id}"
  		else
  			render "/surveys/new"
  		end
  	end
  end

  def show
  	@survey = Survey.find_by(id: params[:survey_id])
    @question = Question.find_by(id: params[:id])
  
  end

  def edit
    @survey = Survey.find_by(id: params[:survey_id])
    p "******"
    p @survey
    p "******"

    @question = Question.find_by(id: params[:id])
  end

  def update
    @survey = Survey.find_by(id: params[:survey_id])
    @question = Question.find_by(id: params[:id])
    @question.update(user_params)
    redirect_to survey_question_url
  end

  def destroy
       @survey = Survey.find_by(id: params[:survey_id])
      @question = Question.find_by(id: params[:id])
      @question.destroy
      redirect_to survey_url

  end




  private
  def user_params
    params.require(:question).permit(:question_name, :survey_id)
  end


end