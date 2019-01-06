# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
EmployeeManager.create(name: "Navin", email: "navinkumar2508@gmail.com", password: "navin123")
5.times do
	EmployeeMember.create(
		name: Faker::Name.name,
		email: Faker::Internet.unique.free_email,
		password: "dummy123"
		)
end
6.times.each_with_index do |k,v|
	Place.create(
		proposed_place: Faker::Name.unique.name,
		employee_id: v+1
		)
end
