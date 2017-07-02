class WelcomeController < ApplicationController
  def index
  	if logged_in?
  		@surveys = Survey.where("user_id = ?", current_user.id)
  	end
  end
end
