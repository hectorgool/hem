# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#santo, create admin user
unless User.exists?(email: "santo@santo.com")
	User.create!(firstname: "Rodolfo", lastname: "Guzman Huerta", email: "santo@santo.com", password: "asdfasdf", admin: true
)
end

#santo. create user
unless User.exists?(email: "erick.gpea@gmail.com")
  User.create!(firstname: "Erick", lastname: "Aponte", email: "erick.gpea@gmail.com", password: "asdfasdf")
end

#santo. create user
unless User.exists?(email: "hectorgool@gmail.com")
  User.create!(firstname: "Hector", lastname: "Gonzalez Olmos", email: "hectorgool@gmail.com", password: "asdfasdf")
end