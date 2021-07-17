# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  {title:'Frontend'},
  {title:'Backend'},
  {title:'Mobile devops'},
  {title:'Data science'}
])

Test.create([
   {title:'Ruby', level:1, category_id:2},
   {title:'Ruby', level:2, category_id:2},
   {title:'HTML', level:0, category_id:1},
   {title:'SCC', level:1, category_id:1},
   {title:'Go', level:2, category_id:3},
   {title:'Phyton', level:2, category_id:4}
  ])
Question.create([
  {test_id:1, body:'For what Ruby is used usually'},
  {test_id:3, body:'For what HTML is used'},
  {test_id:2, body:'Haw chenge values in a & b each other'},
  {test_id:4, body:'For what CSS is used '},
  {test_id:5, body:'What common between Ruby and Phyton'}
  ])
Answer.create([
 {question_id:1, body:'For Backend production', correct:true},
 {question_id:1, body:'For Frontend production', correct:false},
 {question_id:1, body:'For BigData and Analitic', correct:false },
 {question_id:2, body:'For Frontend production', correct:true},
 {question_id:5, body:'Both lenguage with dynamic typing jf data', correct:true},
 {question_id:4, body:'For drawing and decoration HTML pages', correct:true},
             ])
User.create([
  {name:'Masha', password:'12345', status:'test object'},
  {name:'Glasha', password:'12345', status:'test object'},
  {name:'Pasha', password:'12345', status:'test object'},
  {name:'Veniamin', password:'qwerty', status:'test maker'}
            ])
