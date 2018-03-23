# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Михаил' },
                     { name: 'Геннадий' }])

categories = Category.create([{ title: 'География' },
                              { title: 'Музыка' },
                              { title: 'Спорт' }])

tests = Test.create([{ title: 'Столицы мира', level: 1, category_id: categories[0].id, author_id: users[0].id },
                     { title: 'Рок музыка', level: 1, category_id: categories[1].id, author_id: users[1].id },
                     { title: 'Футбол', level: 1, category_id: categories[2].id,  author_id: users[0].id }])

questions = Question.create([{ body: 'Как называется столица Бразилии?', test_id: tests[0].id },
                             { body: 'Как звали фронтмена группы Нирвана?', test_id: tests[1].id },
                             { body: 'У какого футболиста псевдоним "Эль Феномено"?', test_id: tests[2].id }])

answers = Answer.create([{ body: 'Бразилиа', correct: true, question_id: questions[0].id },
                         { body: 'Курт Кобейн', correct: true, question_id: questions[1].id },
                         { body: 'Роналдо', correct: true, question_id: questions[2].id }])

test_passages = TestPassage.create([{ user_id: users[0].id, test_id: tests[0].id },
                                   { user_id: users[1].id, test_id: tests[1].id }])
