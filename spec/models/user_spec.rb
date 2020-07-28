require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should have password field' do
      @user = User.new(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: nil, password_confirmation: "hi")
      expect(@user).to_not be_valid
    end

    it 'should have password_confirmation field' do
      @user = User.new(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hi", password_confirmation: "")
      expect(@user).to_not be_valid
    end

    it 'should have matching password and password_confirmation fields (complies)' do
      @user = User.new(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hi", password_confirmation: "hi")
      expect(@user).to be_valid
    end

    it 'should have matching password and password_confirmation fields (violates)' do
      @user = User.new(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hi", password_confirmation: "hello")
      expect(@user).to_not be_valid
    end

    it 'should have first_name field' do
      @user = User.new(first_name: nil, last_name: "Sun", email: "ericasun@email.com", password: "hi", password_confirmation: "hi")
      expect(@user).to_not be_valid
    end

    it 'should have last_name field' do
      @user = User.new(first_name: "Erica", last_name: nil, email: "ericasun@email.com", password: "hi", password_confirmation: "hi")
      expect(@user).to_not be_valid
    end

    it 'should have email field' do
      @user = User.new(first_name: "Erica", last_name: "Sun", email: nil, password: "hi", password_confirmation: "hi")
      expect(@user).to_not be_valid
    end

    it 'should have unique email field' do
      @user1 = User.create(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hi", password_confirmation: "hi")
      @user2 = User.new(first_name: "John", last_name: "Smith", email: "ericaSUN@email.com", password: "hello", password_confirmation: "hello")
      expect(@user2).to_not be_valid
    end

    it 'should have password minimum length' do
      @user = User.new(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "h", password_confirmation: "h")
      expect(@user).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should log user in if credentials are correct' do
      @user = User.create(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hello", password_confirmation: "hello")
      expect(User.authenticate_with_credentials("ericasun@email.com", "hello")).to eq(@user)
    end

    it 'should not log user in if email is missing' do
      @user = User.create(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hello", password_confirmation: "hello")
      expect(User.authenticate_with_credentials("", "hello")).to be_nil
    end

    it 'should not log user in if password is missing' do
      @user = User.create(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hello", password_confirmation: "hello")
      expect(User.authenticate_with_credentials("ericasun@email.com", "")).to be_nil
    end

    it 'should log user in regardless of email case' do
      @user = User.create(first_name: "Erica", last_name: "Sun", email: "eRicasun@email.com", password: "hello", password_confirmation: "hello")
      expect(User.authenticate_with_credentials("eRiCaSun@email.COm", "hello")).to eq(@user)
    end 

    it 'should not log user in if password case is different' do
      @user = User.create(first_name: "Erica", last_name: "Sun", email: "ericasun@email.com", password: "hello", password_confirmation: "hello")
      expect(User.authenticate_with_credentials("ericasun@email.com", "heLlo")).to be_nil
    end

    it 'should log user in regardless of email spaces before' do
    end 

    it 'should log user in regardless of email spaces after' do
    end 

    it 'should log user in regardless of email spaces before and after' do
    end 





  end

end
