# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create(name: 'Ukrainian')
Language.create(name: 'English')
Language.create(name: 'Russian')

Game.create(name: 'DayZ')
Game.create(name: 'SAMP')
Game.create(name: 'The Forest')
Game.create(name: 'Minecraft')