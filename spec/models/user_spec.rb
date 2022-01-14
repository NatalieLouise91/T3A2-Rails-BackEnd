require 'rails_helper'

RSpec.describe User, type :model do

    it 'has an email' do
        user = User.new(
            email: "",
            password_digest: "password",
            admin: true,
            first_name: "first name",
            last_name: "last name",
            phone: 1,
        )
        expect(user).to_not be_valid

        user.email = "email"
        expect(user).to be_valid

        expect(user.email).to eq('email')
    end 

    it 'has a password' do
        user = User.new(
            email: "email",
            password_digest: "",
            admin: true,
            first_name: "first name",
            last_name: "last name",
            phone: 1,
        )
        expect(user).to_not be_valid

        user.password_digest = "password"
        expect(user).to be_valid

        expect(user.password_digest).to eq("password")
    end 

    it 'has an admin value' do
        user = User.new(
            email: "email",
            password_digest: "password",
            admin: '',
            first_name: "first name",
            last_name: "last name",
            phone: 1,
        )
        expect(user).to_not be_valid

        user.admin = true
        expect(user).to be_valid

        expect(user.admin).to eq(true)
    end 

    it 'has a first_name' do
        user = User.new(
            email: "email",
            password_digest: "password",
            admin: true,
            first_name: "",
            last_name: "last name",
            phone: 1,
        )
        expect(user).to_not be_valid

        user.first_name = "first name"
        expect(user).to be_valid

        expect(user.first_name).to eq('first name')
    end 

    it 'has a last_name' do
        user = User.new(
            email: "email",
            password_digest: "password",
            admin: true,
            first_name: "first name",
            last_name: "",
            phone: 1,
        )
        expect(user).to_not be_valid

        user.last_name = "last name"
        expect(user).to be_valid

        expect(user.last_name).to eq('last name')
    end 

    it 'has a phone number' do
        user = User.new(
            email: "email",
            password_digest: "password",
            admin: true,
            first_name: "first name",
            last_name: "last name",
            phone: "",
        )
        expect(user).to_not be_valid

        user.phone = 1
        expect(user).to be_valid

        expect(user.phone).to eq(1)
    end 
end