# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Михаил', password: '1234', email: 'user1@example.com', first_name: 'Михаил', last_name: 'Крылов' },
                     { name: 'Геннадий', password: '1234', email: 'user2@example.com', first_name: 'Геннадий', last_name: 'Девелоперский' }])

categories = Category.create([{ title: 'География' },
                              { title: 'Спорт' }])

tests = Test.create([{ title: 'Столицы мира', level: 1, category: categories[0], author: users[0] },
                     { title: 'Футбол', level: 1, category: categories[1], author: users[0] }])

questions = Question.create([{ body: 'Столица Бразилии?', test: tests[0] },
                             { body: 'Столица Норвегии?', test: tests[0] },
                             { body: 'Столица Ватикана?', test: tests[0] },
                             { body: 'Столица Швейцарии?', test: tests[0] },
                             { body: 'Столица Монголии?', test: tests[0] },
                             { body: 'У какого футболиста псевдоним Эль Феномено?', test: tests[1] },
                             { body: 'В каком клубе играет Лионель Месси?', test: tests[1] },
                             { body: 'Единственный клуб в истории футбола, оформивший 2 требла это?', test: tests[1] },
                             { body: 'Кого звали летучим голландцем?', test: tests[1] },
                             { body: 'До перехода в Барселону, в каких клубах играл Луис Суарес?', test: tests[1] }])

answers = Answer.create([{ body: 'Бразилиа', correct: true, question: questions[0] },
                         { body: 'Рио-де-Жанейру', correct: false, question: questions[0] },
                         { body: 'Порту-Аллегри', correct: false, question: questions[0] },
                         { body: 'Сан-Паулу', correct: false, question: questions[0] },

                         { body: 'Хельсинки', correct: false, question: questions[1] },
                         { body: 'Стокгольм', correct: false, question: questions[1] },
                         { body: 'Осло', correct: true, question: questions[1] },
                         { body: 'Копенгаген', correct: false, question: questions[1] },

                         { body: 'Рим', correct: false, question: questions[2] },
                         { body: 'Андорра', correct: false, question: questions[2] },
                         { body: 'Люксемпург', correct: false, question: questions[2] },
                         { body: 'Ватикан это город государство', correct: true, question: questions[2] },

                         { body: 'Зальцбург', correct: false, question: questions[3] },
                         { body: 'Вена', correct: false, question: questions[3] },
                         { body: 'Цюрих', correct: false, question: questions[3] },
                         { body: 'Берн', correct: true, question: questions[3] },

                         { body: 'Сеул', correct: false, question: questions[4] },
                         { body: 'Ханой', correct: false, question: questions[4] },
                         { body: 'Шанхай', correct: false, question: questions[4] },
                         { body: 'Улан-Батор', correct: true, question: questions[4] },

                         { body: 'Роналдиньо', correct: false, question: questions[5] },
                         { body: 'Роналдо', correct: true, question: questions[5] },
                         { body: 'Бекхэм', correct: false, question: questions[5] },
                         { body: 'Зидан', correct: false, question: questions[5] },

                         { body: 'Милан', correct: false, question: questions[6] },
                         { body: 'Барселона', correct: true, question: questions[6] },
                         { body: 'Севилья', correct: false, question: questions[6] },
                         { body: 'Манчестер Сити', correct: false, question: questions[6] },

                         { body: 'Реал Мадрид', correct: false, question: questions[7] },
                         { body: 'Ливерпуль', correct: false, question: questions[7] },
                         { body: 'Бавария', correct: false, question: questions[7] },
                         { body: 'Барселона', correct: true, question: questions[7] },

                         { body: 'Ван Бастен', correct: false, question: questions[8] },
                         { body: 'Ван Нистелрой', correct: false, question: questions[8] },
                         { body: 'Ринус Михельс', correct: false, question: questions[8] },
                         { body: 'Йохан Кройф', correct: true, question: questions[8] },

                         { body: 'Аякс', correct: true, question: questions[9] },
                         { body: 'Фейеноорд', correct: false, question: questions[9] },
                         { body: 'Ливерпуль', correct: true, question: questions[9] },
                         { body: 'Гронинген', correct: true, question: questions[9] }])

test_passages = TestPassage.create([{ user: users[0], test: tests[0], current_question_id: nil, correct_questions: nil },
                                   { user: users[1], test: tests[1], current_question_id: nil, correct_questions: nil }])
