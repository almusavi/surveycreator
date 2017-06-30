class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    
  end

  def create
  end

end