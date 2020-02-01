# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
	user = User.new(
		email: Faker::Internet.unique.email,
		password: Faker::Internet.password(min_length: 6),
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		city: Faker::Address.city,
		address: Faker::Address.full_address
	)
	user.save!
end
