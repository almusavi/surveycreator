# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(username: "Al", email: "almusavi@gmail.com", hashed_password: "al")
survey = Survey.create!(name: "first survey", user_id: user.id)
question = Question.create!(question_name: "Which season do you like?", survey_id: survey.id)
answer1 = Answer.create!(answer_name: "Winter", question_id: "1")
answer2 = Answer.create!(answer_name: "Spring", question_id: "1")
answer3 = Answer.create!(answer_name: "Summer", question_id: "1")
answer4 = Answer.create!(answer_name: "Fall", question_id: "1")


