# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

User.create [{ username: 'Bobby' }, { username: 'Jimmy' }, { username: 'Judy' }]
Poll.create [{ title: 'your pets', user_id: '1' }, { title: 'your pets', user_id: '3' },{ title: 'foods', user_id: '1' },{ title: 'foods', user_id: '2' }]

Question.create [
  { text: 'Who\'s your favorite cat?', poll_id: '1' },
  { text: 'Who\'s your favorite dog?', poll_id: '2' },
  { text: 'What\'s your favorite breakfast?', poll_id: '3' },
  { text: 'What\'s your favorite lunch?', poll_id: '4' }
]

AnswerChoice.create [
  { text: 'Suger Tommy', question_id: '1' },
  { text: 'Cute Sunny', question_id: '1' },
  { text: 'Sugi Bear', question_id: '2' },
  { text: 'Himma Suji', question_id: '2' },
  { text: 'Oatmeal', question_id: '3' },
  { text: 'Eggs and Bacon', question_id: '3' },
  { text: 'Ham Sandwitch', question_id: '4' },
  { text: 'Salad', question_id: '4' }
]

Response.create [
  { user_id: '1', answer_choice_id: '2' },
  { user_id: '1', answer_choice_id: '5' },
  { user_id: '2', answer_choice_id: '8' },
  { user_id: '3', answer_choice_id: '3' },
]
