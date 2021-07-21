# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  {title:'Frontend'},
  {title:'Backend'},
  {title:'Mobile devops'},
  {title:'Data science'}
  ])

tests = Test.create([
  {title:'Ruby', level:1, category_id:categories[1].id},
  {title:'Ruby', level:2, category_id:categories[1].id},
  {title:'HTML', level:0, category_id:categories[0].id},
  {title:'SCC', level:1, category_id:categories[0].id},
  {title:'Go', level:2, category_id:categories[2].id},
  {title:'Phyton', level:2, category_id:categories[3].id}
  ])
questions = Question.create([
  {test_id:tests[0].id, body:'For what Ruby is used usually'},
  {test_id:tests[2].id, body:'For what HTML is used'},
  {test_id:tests[1].id, body:'Haw chenge values in a & b each other'},
  {test_id:tests[3].id, body:'For what CSS is used '},
  {test_id:tests[4].id, body:'What common between Ruby and Phyton'}
  ])
Answer.create([
 {question_id:questions[0].id, body:'For Backend production', correct:true},
 {question_id:questions[0].id, body:'For Frontend production', correct:false},
 {question_id:questions[0].id, body:'For BigData and Analitic', correct:false },
 {question_id:questions[1].id, body:'For Frontend production', correct:true},
 {question_id:questions[4].id, body:'Both lenguage with dynamic typing jf data', correct:true},
 {question_id:questions[3].id, body:'For drawing and decoration HTML pages', correct:true},
 ])
users = User.create([
  {name:'Masha', password:'12345', status:'test object'},
  {name:'Glasha', password:'12345', status:'test object'},
  {name:'Pasha', password:'12345', status:'test object'},
  {name:'Veniamin', password:'qwerty', status:'test maker'}
  ])
TestsUser.create([
  {test_id:tests[0].id, user_id:users[0].id, progress:2},
  {test_id:tests[1].id, user_id:users[0].id, progress:2},
  {test_id:tests[3].id, user_id:users[0].id, progress:2},
  {test_id:tests[0].id, user_id:users[1].id, progress:1},
  {test_id:tests[1].id, user_id:users[1].id, progress:1},
  {test_id:tests[2].id, user_id:users[1].id, progress:1},
  {test_id:tests[3].id, user_id:users[2].id, progress:1}
  ])
