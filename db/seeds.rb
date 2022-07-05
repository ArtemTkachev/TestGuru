# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create([{ title: "Ruby" }, { title: "Go" }, { title: "JS" }])
User.create([{ name: "Artur", password: "123asdf" }, { name: "John", password: "456qwer" }])
Test.create([{ title: "General Ruby", level: 1, category_id: 1, author_id: 1 },
               { title: "General Go", level: 1, category_id: 2, author_id: 1 },
               { title: "General JS", level: 2, category_id: 3, author_id: 1 },
               { title: "Practical Go", level: 2, category_id: 2, author_id: 2 } ,
               { title: "Practical JS", level: 3, category_id: 3, author_id: 2 }])
Question.create([{ body: "What type of programming language does Go belong to?", test_id: 2 },
                   { body: "What type of programming language does Ruby belong to?", test_id: 1 },
                   { body: "What type of programming language does JS belong to?", test_id: 3 },
                   { body: "List the Go language data types", test_id: 4 },
                   { body: "List the Ruby language data types", test_id: 5 }])
Answer.create([{ body: "I don't know Go", correct: false, question_id: 1 },
                 { body: "I don't know Ruby", correct: false, question_id: 2 },
                 { body: "I don't know JS", correct: false, question_id: 3 },
                 { body: "I don't know Go data types", correct: false, question_id: 4 },
                 { body: "I don't know Ruby data types", correct: false, question_id: 5 }])
User.find(1).tests << Test.find(1)
User.find(1).tests << Test.find(2)
User.find(1).tests << Test.find(3)
User.find(2).tests << Test.find(4)
User.find(2).tests << Test.find(5)
User.find(2).tests << Test.find(1)


