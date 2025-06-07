# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

puts "Nettoyage des données..."

City.delete_all
Accomodation.delete_all
Reservation.delete_all
UserRole.delete_all
Role.delete_all
User.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='accomodations'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='reservations'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='user_roles'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='roles'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")

roles = [ "host", "guest" ]

puts "ajoute des users"
10.times do |user|
  user=User.create!(
    email: Faker::Internet.unique.email,
    phone_number: "06#{Faker::Number.number(digits: 8)}",
    description: Faker::Lorem.sentence(word_count: 10)
  )
  user.add_role(roles.sample)
end
puts "Users créés avec succès !"

puts "ajoute des villes"
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Number.number(digits: 5).to_s
  )
end
puts "Villes créées avec succès !"

puts "ajoute des logements"
10.times do
  Accomodation.create!(
    available_beds: Faker::Number.between(from: 1, to: 10),
    price: Faker::Commerce.price(range: 10.0..500.0, as_string: true),
    description: Faker::Lorem.paragraph(sentence_count: 150),
    welcome_message: Faker::Lorem.sentence(word_count: 15),
    has_wifi: Faker::Boolean.boolean
    # user_id: User.pluck(:id).sample,
    # city_id: City.pluck(:id).sample
  )
end
puts "Logements créés avec succès !"


puts "ajoute des réservations"
5.times do
  start_time = Faker::Time.forward(days: 90, period: :morning)
  end_time = start_time + Faker::Number.between(from: 1, to: 10).days

  Reservation.create!(
    start_time: start_time,
    end_time: end_time
    # accomodation_id: Accomodation.pluck(:id).sample,
    # user_id: User.pluck(:id).sample
  )
end
puts "Réservations créées avec succès !"
