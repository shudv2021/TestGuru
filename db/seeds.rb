# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Mobile devops' },
                               { title: 'Data science' }
                             ])
users = User.create([
                      { password: '123456', email: 'mail@yandex.ru' },
                      { password: '123456', email: 'Glasha@yandex.ru'  },
                      { password: '123456', email: 'Pasha@yandex.ru' },
                      { password: '123456', first_name: 'Dmitry', last_name: 'Dmitry', email: 'shudv@yandex.ru', type: 'Admin' }
                    ])
tests = Test.create([
                      { title: 'Ruby', level: 1, category_id: categories[1].id, user_id: users[3].id },
                      { title: 'Ruby', level: 2, category_id: categories[1].id, user_id: users[3].id },
                      { title: 'HTML', level: 0, category_id: categories[0].id, user_id: users[3].id },
                      { title: 'SCC', level: 1, category_id: categories[0].id, user_id: users[3].id },
                      { title: 'Go', level: 2, category_id: categories[2].id, user_id: users[3].id },
                      { title: 'Phyton', level: 2, category_id: categories[3].id, user_id: users[3].id },
                      { title: 'Ruby on Rails', level: 5, category_id: categories[1].id, user_id: users[3].id }
                    ])
questions = Question.create([
                              { test_id: tests[0].id, body: 'For what Ruby is used usually' },
                              { test_id: tests[0].id, body: 'For what HTML is used' },
                              { test_id: tests[2].id, body: 'Haw chenge values in a & b each other' },
                              { test_id: tests[2].id, body: 'For what CSS is used ' },
                              { test_id: tests[0].id, body: 'What common between Ruby and Phyton' }
                            ])
Answer.create([
                { question_id: questions[0].id, body: 'For Backend production', correct: true },
                { question_id: questions[0].id, body: 'For Frontend production', correct: false },
                { question_id: questions[0].id, body: 'For BigData and Analitic', correct: false },
                { question_id: questions[1].id, body: 'For Frontend production', correct: true },
                { question_id: questions[4].id, body: 'Both language with dynamic typing jf data', correct: true },
                { question_id: questions[3].id, body: 'For drawing and decoration HTML pages', correct: true }
              ])

Badge.create([
               {name: 'From first attempt', rule: 'success_from_first_attempt',  image_url: 'image_url'},
             {name: "Category master", rule: 'resolved_all_from_category',  image_url: 'image_url'},
             {name: 'Level master', rule: 'resolved_all_in_level',  image_url: 'image_url'}
          ])

