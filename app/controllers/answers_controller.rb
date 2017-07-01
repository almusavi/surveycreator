class AnswersController < ApplicationController
  def index
    @survey = Survey.find_by(id: params[:survey_id])
    # @answer = Answer.find_by(survey_id: @survey.id)
    @answers = Answer.where("survey_id = ?", @survey.id)
    p @answers

  end

  def new
    @survey = Survey.find_by(id: params[:survey_id])
    @answers = Answer.where("survey_id = ?", @survey.id)
  end

  def create
    @survey = Survey.find_by(id: params[:survey_id])

    @answer = Answer.new(user_params)
    @answer.survey_id = @survey.id

    if request.xhr?
      if @answer.save
        erb :"/surveys/_new_survey", layout: false, local: {survey: @survey}
      else
        erb :"surveys/_errors", layout: false, locals: {survey: @survey}
      end
    else
      if @answer.save
        p "it's coming to redirect"
        redirect_to "/surveys/#{@survey.id}/answers"      
      else
        p "in the new survey"
        render "/surveys/new"
      end
    end
  end

private
  def user_params
    params.require(:answer).permit(:answer_name, :survey_id)
  end


end