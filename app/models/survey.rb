class Survey < ApplicationRecord
	belongs_to :user, foreign_key: :creator_id, class_name: "User"
	belongs_to :user, foreign_key: :taker_id, class_name: "User" 
end
