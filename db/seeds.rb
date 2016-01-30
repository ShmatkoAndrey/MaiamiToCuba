# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ferry.create(name: "DeadLecho", typeship: "large")
Ferry.create(name: "Skype", typeship: "small")

Timetable.create(date: Date.new(2016,1,29), ferry_id: 1)
Timetable.create(date: Date.new(2016,1,28), ferry_id: 1)
Timetable.create(date: Date.new(2016,1,30), ferry_id: 1)
Timetable.create(date: Date.new(2016,1,28), ferry_id: 2)
Timetable.create(date: Date.new(2016,1,30), ferry_id: 2)