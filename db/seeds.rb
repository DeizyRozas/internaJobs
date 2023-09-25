# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
    user = User.create( email: "admin@gmail.com",  password:"123456")
#   Character.create(name: "Luke", movie: movies.first)
    user.add_role :admin

    empleado = User.create(email: "empleado@gmail.com", password: "123456")
    empleado.add_role :employee

    require 'faker' 

    
    10.times do |i|
        Joboffer.create(title: Faker::Job.title, description: Faker::Job.position)
    end