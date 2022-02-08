require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    it "Valid when no attributes are missing and password confirmation matches password" do
      user = User.new(first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end
    
    it "invalid when first_name is missing" do
      user = User.new(first_name: nil, last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234")
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "invalid when last_name is missing" do
      user = User.new(first_name: "John", last_name: nil, email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234")
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "invalid when email is missing" do
      user = User.new(first_name: "John", last_name: "Doe", email: nil, password: "ABCD1234", password_confirmation: "ABCD1234")
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "invalid when password is missing" do
      user = User.new(first_name: "John", last_name: "Doe", email: "test@test.com", password: nil, password_confirmation: "ABCD1234")
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "invalid when password and password_confirmation does not match password" do
      user = User.new(first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "abcd1234")
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "invalid when password less than 8 characters" do
      user = User.new(first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCDEFG", password_confirmation: "ABCDEFG")
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it "valid if email is already registered and password is matched" do
      user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
      expect(User.authenticate_with_credentials("test@test.com", "ABCD1234")).to eql(user)
    end

    it "invalid if email is not registered" do
      user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
      expect(User.authenticate_with_credentials("t@test.com", "ABCD1234")).to eql(nil)
    end

    it "invalid if email is registered and password doesn't match" do
      user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
      expect(User.authenticate_with_credentials("test@test.com", "abcd1234")).to eql(nil)
    end

    it "valid if put extra space before email" do
      user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
      expect(User.authenticate_with_credentials(" test@test.com", "ABCD1234")).to eql(user)
    end

    it "valid if put extra space after email" do
      user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
      expect(User.authenticate_with_credentials("test@test.com ", "ABCD1234")).to eql(user)
    end

    it "valid if put extra space before and after email" do
      user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
      expect(User.authenticate_with_credentials(" test@test.com ", "ABCD1234")).to eql(user)
    end

    it "valid if email typed in the wrong case" do
      user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
      expect(User.authenticate_with_credentials("TesT@test.CoM ", "ABCD1234")).to eql(user)
    end
  end
end
