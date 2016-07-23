# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create!(email: 'giamarinob@gmail.com', name: 'Ben Giamarino', password: 'phoenix1', is_admin: true)
Member.create!(email: 'eachandler@comcast.net', name: 'Betty Chandler', password: 'phoenix1', is_admin: true)