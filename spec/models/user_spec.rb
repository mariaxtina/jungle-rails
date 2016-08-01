require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'creates a user' do
      user = User.new(name: "Xtina", email: "hi@gmail.com", password: "hi", password_confirmation: "hi")
      expect(user.valid?).to eql true
    end
    it 'fails when user has no name' do
      user = User.new(name: nil, email: "hi@gmail.com", password: "hi", password_confirmation: "hi")
      expect(user.valid?).to eql false
      expect(user.errors.size).to eql 1
      expect(user.errors[:name]).to eql ["can't be blank"]
    end
    it 'fails when user has no email' do
      user = User.new(name: "Xtina", email: nil, password: "hi", password_confirmation: "hi")
      expect(user.valid?).to eql false
      expect(user.errors.size).to eql 1
      expect(user.errors[:email]).to eql ["can't be blank"]
    end
    it 'fails when user has no password' do
      user = User.new(name: "Xtina", email: "hi@gmail.com", password: nil, password_confirmation: "hi")
      expect(user.valid?).to eql false
      expect(user.errors.size).to eql 1
      expect(user.errors[:password]).to eql ["can't be blank"]
    end
    it 'fails when user email is not unique' do
      user1 = User.create!(name: "Xtina", email: "test@test.COM", password: "hi", password_confirmation: "hi")
      user = User.new(name: "Xtina", email: "TEST@TEST.com", password: "hi", password_confirmation: "hi")
      expect(user.valid?).to eql false
      expect(user.errors.size).to eql 1
      expect(user.errors[:email]).to eql ["has already been taken"]
    end
  end

  describe '.password_length?' do
    it 'fails when password is too short' do
      user = User.new(name: "Xtina", email: "hi@gmail.com", password: "h", password_confirmation: "h")
      expect(user.password_length?(user.password)).to eql false
    end
  end
  describe '.authenticate_with_credentials' do
    it 'works when login email and password match db email and password' do
      user = User.create!(name: "Xtina", email: "hi@gmail.com", password: "hi", password_confirmation: "hi")
      email = "hi@gmail.com"
      password = "hi"
      expect(User.authenticate_with_credentials(email, password)).to eql user
    end
    it 'fails when login email does not match db email' do
      User.create!(name: "Xtina", email: "hi@gmail.com", password: "hi", password_confirmation: "hi")
      email = "wow@gmail.com"
      password = "hi"
      expect(User.authenticate_with_credentials(email, password)).to eql false
    end
    it 'works when login email is valid and includes spaces' do
      user = User.create!(name: "Xtina", email: "hi@gmail.com", password: "hi", password_confirmation: "hi")
      email = " hi@gmail.com "
      password = "hi"
      expect(User.authenticate_with_credentials(email, password)).to eql user
    end
    it 'fails when login email does not match db email' do
      user = User.create!(name: "Xtina", email: "hi@gmail.com", password: "hi", password_confirmation: "hi")
      email = "hi@gmail.COM"
      password = "hi"
      expect(User.authenticate_with_credentials(email, password)).to eql user
    end
    it 'fails when login email password does not match db password' do
      User.create!(name: "Xtina", email: "hi@gmail.com", password: "hi", password_confirmation: "hi")
      email = "hi@gmail.com"
      password = "hello"
      expect(User.authenticate_with_credentials(email, password)).to eql false
    end
  end
end
