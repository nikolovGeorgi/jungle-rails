require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should be valid' do
      user = User.create(
        first_name: 'Georgi',
        last_name: 'Nikolov',
        email: 'gnikolov@sfu.ca',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(user).to be_valid
    end

    it 'first and last name should be valid' do
      user = User.create(
        first_name: nil,
        last_name: nil,
        email: 'test@test.ca',
        password: 'h123456i',
        password_confirmation: 'h123456i'
      )
      expect(user).to_not be_valid
    end

    it 'password should be minimum 6 characters' do
      user = User.create(
        first_name: 'nil',
        last_name: 'nil',
        email: 'test@test.ca',
        password: '12345',
        password_confirmation: '12345'
      )

      expect(user).to_not be_valid
    end

    it 'password and password_confirmation must match to save user' do
      user = User.create(
        first_name: 'hi',
        last_name: 'q',
        email: 'test@test.ca',
        password: 'h123456i',
        password_confirmation: 'h123456i'
      )
      expect(user).to be_valid
    end

    it 'should have email' do
      user = User.create(
        first_name: 'hi',
        last_name: 'q',
        email: nil,
        password: 'h123456i',
        password_confirmation: 'h123456i'
      )
      expect(user).to_not be_valid
    end

    it 'email should be unique' do
      user = User.create(
        first_name: 'test1',
        last_name: 'test1',
        email: 'test@test.CA',
        password: 'h123456i',
        password_confirmation: 'h123456i'
      )
      duplicate_user = user.dup
      expect(duplicate_user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should redirect to /' do
      user = {email: 'gnikolov@sfu.ca', password: "test123"}
      get '/login'
      post '/login' user
      expect(response).to redirect_to('/')
    end
  end
end
