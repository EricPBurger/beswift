# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts "Clearing database..."
Booking.destroy_all
Costume.destroy_all
User.destroy_all
puts "Creating users..."
	user = User.new(
		email: 'james@beswift.org',
		password: '123456',
		first_name: 'James',
		last_name: 'Trinder',
		city: 'London',
		address: "46 Barnsbury Road, London N1 0HD"
	)
  user.avatar.attach(io: open('https://avatars3.githubusercontent.com/u/39556334?s=460&v=4'), filename: "james_face.jpg", content_type: "image/jpg")
  user.save!
  user = User.new(
    email: 'jamie@beswift.org',
    password: '123456',
    first_name: 'Jamie',
    last_name: 'Newton',
    city: 'London',
    address: "46 Barnsbury Road, London N1 0HD"
  )
  user.avatar.attach(io: open('https://avatars2.githubusercontent.com/u/33573418?s=460&v=4'), filename: "jamie_face.jpg", content_type: "image/jpg")
  user.save!
  user = User.new(
    email: 'eric@beswift.org',
    password: '123456',
    first_name: 'Eric',
    last_name: 'Burger',
    city: 'London',
    address: "46 Barnsbury Road, London N1 0HD"
  )
  user.avatar.attach(io: open('https://avatars2.githubusercontent.com/u/25728050?s=460&v=4'), filename: "eric_face.jpg", content_type: "image/jpg")
  user.save!
  user = User.new(
    email: 'lili@beswift.org',
    password: '123456',
    first_name: 'Lili',
    last_name: 'Martins Cosentino',
    city: 'London',
    address: "46 Barnsbury Road, London N1 0HD"
  )
  user.avatar.attach(io: open('https://avatars2.githubusercontent.com/u/39335511?s=460&v=4'), filename: "lili_face.jpg", content_type: "image/jpg")
  user.save!
  user = User.new(
    email: 'test@beswift.org',
    password: '123456',
    first_name: 'Tay',
    last_name: 'Swifto',
    city: 'London',
    address: "46 Barnsbury Road, London N1 0HD"
  )
  user.avatar.attach(io: open('https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/muzooka/Taylor%2BSwift/Taylor%2520Swift_16_9_1578384864.jpg?itok=EHqXQIe6'), filename: "tay_face.jpg", content_type: "image/jpg")
  user.save!

puts "Creating costumes..."

	costume = Costume.new(
		costume_name: 'Blue Playsuit',
		origin: 'VMAs',
		price: '23',
		desc_short: Faker::GreekPhilosophers.quote,
		desc_long: Faker::Lorem.paragraph(sentence_count: 2),
		size: [6,8,10,12,14,16,18,20,22,24,28].sample,
		availability: true,
		user_id: User.find_by(first_name: 'James').id
		)
    costume.photo.attach(io: open('https://hips.hearstapps.com/elleuk.cdnds.net/15/37/2048x2730/2048x2730-8f14-cbc28d801764-assets-elleuk-com-gallery-15271-taylor-swift-2014-mtv-video-music-awards-getty-jpg.jpg'), filename: "blue_play.jpg", content_type: "image/jpg")
    costume.save!
  costume = Costume.new(
    costume_name: 'Gold Ball Gown',
    origin: 'CMA Awards',
    price: '30',
    desc_short: Faker::GreekPhilosophers.quote,
    desc_long: Faker::Lorem.paragraph(sentence_count: 2),
    size: [6,8,10,12,14,16,18,20,22,24,28].sample,
    availability: true,
    user_id: User.find_by(first_name: 'Eric').id
    )
    costume.photo.attach(io: open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/30-taylor-swift-november-11-2009-1481579119.jpg'), filename: "gold_ball.jpg", content_type: "image/jpg")
    costume.save!
  costume = Costume.new(
    costume_name: 'Monochrome Glam',
    origin: 'ACM Awards',
    price: '18',
    desc_short: Faker::GreekPhilosophers.quote,
    desc_long: Faker::Lorem.paragraph(sentence_count: 2),
    size: [6,8,10,12,14,16,18,20,22,24,28].sample,
    availability: true,
    user_id: User.find_by(first_name: 'Eric').id
    )
    costume.photo.attach(io: open('https://hips.hearstapps.com/harpersbazaaruk.cdnds.net/15/37/original/original-taylor-487517751-master-jpg-4600bc4d.jpg'), filename: "mono_glam.jpg", content_type: "image/jpg")
    costume.save!
  costume = Costume.new(
    costume_name: 'Iridescent Playsuit',
    origin: 'iHeart Radio Music Awards',
    price: '38',
    desc_short: Faker::GreekPhilosophers.quote,
    desc_long: Faker::Lorem.paragraph(sentence_count: 2),
    size: [6,8,10,12,14,16,18,20,22,24,28].sample,
    availability: true,
    user_id: User.find_by(first_name: 'James').id
    )
    costume.photo.attach(io: open('https://media.glamour.com/photos/5c8b1d0898129c2cf7c5ca90/master/w_1600%2Cc_limit/GettyImages-1130566268.jpg'), filename: "irid_play.jpg", content_type: "image/jpg")
    costume.save!

puts  "Database seeded!"
