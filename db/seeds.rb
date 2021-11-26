# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Mobile devops' },
                               { title: 'Data science' }
                             ])
categories = Category.all

User.create([
                      { password: '123456', email: 'mail@yandex.ru' },
                      { password: '123456', email: 'Glasha@yandex.ru' },
                      { password: '123456', email: 'Pasha@yandex.ru' },
                      { password: '123456', first_name: 'Dmitry', last_name: 'Dmitry', email: 'shudv@yandex.ru', type: 'Admin' }
                    ])
users = User.all

Test.create([
                      { title: 'Ruby', level: 2, category_id: categories[1].id, user_id: users[3].id, time_limit: 5  },
                      { title: 'Ruby', level: 2, category_id: categories[1].id, user_id: users[3].id, time_limit: 5  },
                      { title: 'Go', level: 3, category_id: categories[2].id, user_id: users[3].id, time_limit: 5 },
                      { title: 'SCC', level: 1, category_id: categories[0].id, user_id: users[3].id, time_limit: 5  },
                      { title: 'HTMl', level: 1, category_id: categories[0].id, user_id: users[3].id, time_limit: 5  },
                      { title: 'Phyton', level: 2, category_id: categories[3].id, user_id: users[3].id, time_limit: 5  },
                      { title: 'Ruby on Rails', level: 5, category_id: categories[1].id, user_id: users[3].id, time_limit: 5 }
                    ])
tests = Test.all

Question.create([
                              { test_id: tests[0].id, body: 'For what Ruby is used usually' },
                              { test_id: tests[0].id, body: 'For what HTML is used' },
                              { test_id: tests[1].id, body: 'How chenge values in a & b each other' },
                              {test_id: tests[1].id, body: 'Question about ruby level 2'},
                              { test_id: tests[3].id, body: 'For what CSS is used ', },
                              { test_id: tests[0].id, body: 'What common between Ruby and Phyton' },
                              { test_id: tests[3].id, body: 'Question about CSS' },
                              { test_id: tests[2].id, body: 'Question1 about HTML' },
                              { test_id: tests[2].id, body: 'Question2 about HTML' }
                            ])
questions = Question.all

Answer.create([
                { question_id: questions[0].id, body: 'For Backend production', correct: true },
                { question_id: questions[0].id, body: 'For Frontend production', correct: false },
                { question_id: questions[0].id, body: 'For BigData and Analitic', correct: false },
                { question_id: questions[1].id, body: 'For Frontend production', correct: true },
                { question_id: questions[3].id, body: 'True Answer', correct: true },
                { question_id: questions[5].id, body: 'Both language with dynamic typing jf data', correct: true },
                { question_id: questions[4].id, body: 'For drawing and decoration HTML pages', correct: true },
                { question_id: questions[6].id, body: 'True CSS Answer', correct: true },
                { question_id: questions[7].id, body: 'True HTML Answer', correct: true },
                { question_id: questions[8].id, body: 'True HTML Answer', correct: true }
              ])

Badge.create([
               {name: 'From first attempt', rule: 'success_from_first_attempt', image_url: 'image_url'},
             {name: "Category master", rule: 'resolved_all_from_category',  image_url: 'image_url'},
             {name: 'Level master', rule: 'resolved_all_in_level',  image_url: 'image_url'}
          ])

