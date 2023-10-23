require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before :each do
      @user = User.new(first_name: "Peter", last_name: "Parker", email: "spider@man.com", password: "ilovemj", password_confirmation: 'ilovemj')
    end
    
    it "password and password confirmation fields must be the same" do
      @user = User.create(first_name: "Peter", last_name: "Parker", email: "spider@man.com", password: "ilovemj", password_confirmation: 'ilovemj')

      expect(@user).to be_valid
    end

    it "email must unique and not case sensitive" do
      User.create(first_name: "Peter", last_name: "Parker", email: "spider@man.com", password: "ilovemj", password_confirmation: 'ilovemj')
      @duplicate_user = User.create(first_name: "Peter", last_name: "Parker", email: "spider@man.com", password: "iloveblackcat", password_confirmation: 'iloveblackcat')

      expect(@duplicate_user).to_not be_valid
      expect(@duplicate_user.errors.full_messages).to include("Email has already been taken")
    end

    it "email must be present" do
      @user.email = nil

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "first name must be present" do
      @user.first_name = nil

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last name must be present" do
      @user.last_name = nil
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "password must be at least 6 characters" do
      @user.password = 'short'
      @user.password_confirmation = 'short'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  # describe ".authenticate_with_credentials" do

  # end
end
