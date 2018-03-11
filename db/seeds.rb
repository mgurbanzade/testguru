# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: 'Geography' },
                              { title: 'Music' },
                              { title: 'Sports' }])

tests = Test.create([{ title: 'Capitals', level: 1, category_id: categories[0].id },
                     { title: 'Rock Music', level: 1, category_id: categories[1].id },
                     { title: 'Football'}, level: 1, category_id: categories[2].id])

questions = Question.create([{ body: 'What is the capital of Brazil?', test_id: tests[0].id },
                             { body: 'What was the name of Nirvana leader?', test_id: tests[1].id },
                             { body: 'Which footballer has an alias of \'The Phenomenon\'', test_id: tests[2].id }])

answers = Answer.create([{ body: 'Brasilia', correct: true, question_id: questions[0].id },
                         { body: 'Kurt Cobain', correct: true, question_id: questions[1].id },
                         { body: 'Ronaldo', correct: true, question_id: questions[2].id }])

users = User.create([{ name: 'Michael' },
                     { name: 'John' }])

test_passages = TestPassage.create([{ user_id: users[0].id, test_id: tests[0].id },
                                   { user_id: users[1].id, test_id: tests[1].id }])
