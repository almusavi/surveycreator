class AnswersController < ApplicationController
  def index
    @survey = Survey.find_by(id: params[:survey_id])
    # @answer = Answer.find_by(survey_id: @survey.id)
    @answers = Answer.where("question_id = ?", @survey.id)
    p @answers

  end

  def new
    @question = Question.find_by(id: params[:question_id])
    @survey = Survey.find_by(id: @question.survey_id)
    @answers = Answer.where("question_id = ?", @question.id)
  end

  def create
    @question = Question.find_by(id: params[:question_id])
    @survey = Survey.find_by(id: @question.survey_id)
    @answers = Answer.where("question_id = ?", @question.id)

    @answer = Answer.new(user_params)
    @answer.question_id = @question.id

    if request.xhr?
      if @answer.save
        erb :"/surveys/_new_survey", layout: false, local: {survey: @survey}
      else
        erb :"surveys/_errors", layout: false, locals: {survey: @survey}
      end
    else
      if @answer.save
        redirect_to "/surveys/#{@survey.id}/questions/#{@question.id}"     
      else
        render "/questions/#{@question.id}/answers/new"
      end
    end
  end



private
  def user_params
    params.require(:answer).permit(:answer_name, :survey_id)
  end


end