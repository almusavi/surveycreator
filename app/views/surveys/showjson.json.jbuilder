json.surveyname @survey.name
json.questions @survey.questions do |question|
	json.question_name question.question_name
	json.answers question.answers do |answer|
		json.answer_name answer.answer_name
	end
end

