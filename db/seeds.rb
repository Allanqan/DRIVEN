require "open-uri"
require "faker"

puts "Cleaning DB..."
Booking.destroy_all
Driver.destroy_all
User.destroy_all

puts "Creating demo user..."
demo_user = User.create\!(
  email: "demo@driven.app",
  password: "password123",
  first_name: "Demo",
  last_name: "User"
)

puts "Creating drivers..."
female_pictures = [
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651886/szvoreny-attila-Z_DjhwOUvTw-unsplash_b1tcga.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651451/jake-nackos-IF9TK5Uy-KI-unsplash_pwdezk.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651375/christina-wocintechchat-com-SJvDxw0azqw-unsplash_b8zbz9.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651375/christina-wocintechchat-com-Kpd-JMLeKJk-unsplash_itrnxp.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651375/edward-cisneros-_H6wpor9mjs-unsplash_ul5a2w.jpg'
]
male_pictures = [
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651616/linkedin-sales-solutions-pAtA8xe_iVM-unsplash_wgrejc.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651541/ali-morshedlou-WMD64tMfc4k-unsplash_pffbmq.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651375/jurica-koletic-7YVZYZeITc8-unsplash_ak3fba.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651375/joseph-gonzalez-iFgRcqHznqg-unsplash_ew5zzt.jpg',
  'https://res.cloudinary.com/dtwo70uhi/image/upload/v1644651375/ben-parker-OhKElOkQ3RE-unsplash_npnqtl.jpg'
]

locations = [
  '1 Kingsland Rd, London',
  '25 Kingsland Rd, London',
  'Shoreditch, London',
  'Brixton, London',
  'Kings Road, London',
  'Sloane Square, London',
  'Hammersmith, London',
  'Notting Hill, London',
  'Camden, London',
  'Hackney, London'
]

female_pictures.each do |url|
  file = URI.open(url)
  driver = Driver.new(
    name: Faker::Name.female_first_name,
    license_type: ["A", "B", "C"].sample,
    years_driving: rand(1..8),
    transmission: ["auto", "manual"].sample,
    location: locations.sample,
    price: rand(10..50)
  )
  driver.photo.attach(io: file, filename: File.basename(url), content_type: 'image/jpg')
  driver.save\!
end

male_pictures.each do |url|
  file = URI.open(url)
  driver = Driver.new(
    name: Faker::Name.male_first_name,
    license_type: ["A", "B", "C"].sample,
    years_driving: rand(1..30),
    transmission: ["auto", "manual"].sample,
    location: locations.sample,
    price: rand(10..50)
  )
  driver.photo.attach(io: file, filename: File.basename(url), content_type: 'image/jpg')
  driver.save\!
end

puts "Done\! #{Driver.count} drivers created. Demo login: demo@driven.app / password123"