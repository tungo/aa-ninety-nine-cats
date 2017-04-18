# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all

cat1 = Cat.create(birth_date: "2015/01/20", color: 'colorful',
  name: 'Tom', sex: 'M', description: "Colorful kitty")
