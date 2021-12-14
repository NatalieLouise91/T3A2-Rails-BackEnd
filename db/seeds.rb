# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.count == 0
    User.create!(email: "johnny@test.com", password: "password1", password_confirmation: "password1", first_name: "Johnny", last_name: "Nguyen", phone: 000000, admin: true)
    User.create!(email: "jordan@test.com", password: "password2", password_confirmation: "password2", first_name: "Jordan", last_name: "Hardy", phone: 111111)
    User.create!(email: "nat@test.com", password: "password3", password_confirmation: "password3", first_name: "Nat", last_name: "Louise", phone: 222222)
end

if Event.all.length == 0
    Event.create!(
        user_id:1,
        name: "Anniversary",
        description: "happy event",
        date: "20/12/2021",
        attendees: 30,
        location: "Brisbane City",
        time: "2.30pm",
        contact_name: "Johnny",
        contact_phone: 111111 
    )
    Event.create!(
        user_id: 2,
        name: "Wedding",
        description: "happy event",
        date: "20/12/2021",
        attendees: 20,
        location: "Brisbane City",
        time: "2.30pm",
        contact_name: "Jordan",
        contact_phone: 222222 
    )
    Event.create!(
        user_id: 3,
        name: "Graduation",
        description: "happy event",
        date: "20/12/2021",
        attendees: 40,
        location: "Brisbane City",
        time: "2.30pm",
        contact_name: "Natalie",
        contact_phone: 333333 
    )

end