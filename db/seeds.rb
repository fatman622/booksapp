# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


books_list = [
  [ "Talisman", "Some guy", "fantasy", 23 ],
  [ "France", "PAm", "param", 23 ],
  [ "Belgium", "you", "hah", 23 ],
  [ "Netherlands", "param", "dww", 23 ]
]

books_list.each do |name, autor, genre, year|
  Book.create(name: name, autor: autor, genre: genre, year: year)
end