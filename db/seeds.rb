# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.count == 0
    User.create!(email: "johnny@test.com", password: "password1", password_confirmation: "password1", first_name: "Johnny", last_name: "Nguyen", phone: 0404040400, admin: true)
    User.create!(email: "jordan@test.com", password: "password2", password_confirmation: "password2", first_name: "Jordan", last_name: "Hardy", phone: 0404040401)
    User.create!(email: "nat@test.com", password: "password3", password_confirmation: "password3", first_name: "Nat", last_name: "Louise", phone: 0404040402)
end

if Event.all.length == 0
    Event.create!(
        user_id:1,
        name: "Anniversary",
        description: "happy event",
        date: "2022/01/20",
        attendees: 30,
        location: "Brisbane City",
        time: "2.30pm",
        contact_name: "Johnny",
        contact_phone: 0404040400,
        author: "johnny@test.com" 
    )
    Event.create!(
        user_id: 1,
        name: "Wedding",
        description: "happy event",
        date: "2022/01/22",
        attendees: 20,
        location: "Brisbane City",
        time: "2.30pm",
        contact_name: "Jordan",
        contact_phone: 0404040401,
        author: "johnny@test.com" 
    )
    Event.create!(
        user_id: 1,
        name: "Graduation",
        description: "happy event",
        date: "2022/01/25",
        attendees: 40,
        location: "Brisbane City",
        time: "2.30pm",
        contact_name: "Natalie",
        contact_phone: 0404040402,
        author: "johnny@test.com"
    )

end

if Roster.all.length == 0
        Roster.create!(
            user_id: 1,
            event_id: 1,
            start_time: "14:00",
            end_time: "20:00",
            role: "Waiter",
            name: "Johnny Nguyen",
            author: "johnny@test.com"
        )
        Roster.create!(
            user_id:2,
            event_id: 2,
            start_time: "15:00",
            end_time: "21:00",
            role: "Bartender",
            name: "Jordan Hardy",
            author: "johnny@test.com" 
        )
        Roster.create!(
            user_id:3,
            event_id: 2,
            start_time: "16:00",
            end_time: "22:00",
            role: "Chef",
            name: "Natalie Louise",
            author: "johnny@test.com"
        )

end