# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# books_list = [
#   [ "Talisman", "Some guy", "fantasy", 23, 1],
#   [ "France", "PAm", "param", 23, 1],
#   [ "Belgium", "you", "hah", 23, 1],
#   [ "Netherlands", "param", "dww", 23 ,1]
# ]

# books_list.each do |name, autor, genre, year|
#   Book.create(name: name, autor: autor, genre: genre, year: year, user_id: user_id)
# end

profiles_list = [
  [ "Talisman", "Some guy","","", 1],
  [ "France", "PAm","","", 2 ]
]

profiles_list.each do |name, last_name, created_at, updated_at, user_id|
  Profile.create(name: name, last_name: last_name, created_at: created_at, updated_at: updated_at, user_id: user_id)
end