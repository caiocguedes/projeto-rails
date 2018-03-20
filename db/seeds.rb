# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


author = Author.new
author.name = 'Caio Guedes'
author.email = 'ccsguedes@gmail.com'
author.password = '123456'
author.password_confirmation = '123456'
author.save!


author = Author.new
author.name = 'Caio Troll'
author.email = 'caiotroll@gmail.com'
author.password = '123456'
author.password_confirmation = '123456'
author.save!