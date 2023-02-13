# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all

  ActiveRecord::Base.connection.reset_pk_sequence!('users')
  ActiveRecord::Base.connection.reset_pk_sequence!('polls')
  ActiveRecord::Base.connection.reset_pk_sequence!('questions')
  ActiveRecord::Base.connection.reset_pk_sequence!('answer_choices')
  ActiveRecord::Base.connection.reset_pk_sequence!('responses')

  u1 = User.create!(username: 'Fahim')
  u2 = User.create!(username: 'Markov')

  p1 = Poll.create!(title: 'Rails Poll', author: u1)

  q1 = Question.create!(text: 'What is a migration?', poll: p1)
  a1 = AnswerChoice.create!(text: 'When birbs fly south', question: q1)
  a2 = AnswerChoice.create!(text: 'Moving to another country', question: q1)
  a3 = AnswerChoice.create!(text: 'Making a change to a database', question: q1)
  a4 = AnswerChoice.create!(text: 'A class that represents and directly manages the data, logic, and rules for a table', question: q1)

  q2 = Question.create!(text: "What is a database?", poll: p1)
  a5 = AnswerChoice.create!(text: 'A collection of structured information or data', question: q2)
  a6 = AnswerChoice.create!(text: 'An MVC application framework', question: q2)
  a7 = AnswerChoice.create!(text: 'My base of operations', question: q2)
  
  r1 = Response.create!(
    answer_choice: a1,
    respondent: u1
  )
  r2 = Response.create!(
    answer_choice: a5,
    respondent: u2
  )
end