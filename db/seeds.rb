# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Михаил', password: '1234', email: 'user1@example.com' },
                     { name: 'Геннадий', password: '1234', email: 'user2@example.com' }])

categories = Category.create([{ title: 'География' },
                              { title: 'Музыка' },
                              { title: 'Спорт' }])

tests = Test.create([{ title: 'Столицы мира', level: 1, category_id: categories[0].id, author_id: users[0].id },
                     { title: 'Рок музыка', level: 1, category_id: categories[1].id, author_id: users[1].id },
                     { title: 'Футбол', level: 1, category_id: categories[2].id, author_id: users[0].id }])

questions = Question.create([{ body: 'Как называется столица Бразилии?', test_id: tests[0].id },
                             { body: 'Как звали фронтмена группы Нирвана?', test_id: tests[1].id },
                             { body: 'У какого футболиста псевдоним "Эль Феномено"?', test_id: tests[2].id }])

answers = Answer.create([{ body: 'Бразилиа', correct: true, question: questions[0] },
                         { body: 'Курт Кобейн', correct: true, question: questions[1] },
                         { body: 'Роналдо', correct: true, question: questions[2] }])

test_passages = TestPassage.create([{ user_id: users[0].id, test_id: tests[0].id, current_question_id: nil, correct_questions: nil },
                                   { user_id: users[1].id, test_id: tests[1].id, current_question_id: nil, correct_questions: nil }])
