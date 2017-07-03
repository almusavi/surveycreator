class QuestionAnswer < ApplicationRecord
	belongs_to :survey
	belongs_to :question
	belongs_to :user
end
