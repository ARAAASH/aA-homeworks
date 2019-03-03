require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end

  describe "validations" do 
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email)}
    it do 
      should validate_presence_of(:password_digest).
      with_message("Password can\'t be blank.")
    end
    it { should validate_length_of(:password).is_at_least(6) }

    it { should validate_presence_of(:session_token) }

  end

  describe "after initialize" do 
    it "should ensure that session token has been generated" do 
      expect(user.session_token).not_to be_nil
    end
  end

  describe "#password=" do 
    it "set password_digest by using BCrypt" do 
      expect(user.password_digest).not_to be_nil
    end
  end

  describe "#is_password?" do 
    it "should return true if the password is correct" do 
     
      expect(user.is_password?("good_password")).to eq(true)
    end
    it "should return false if the password is incorrect" do 
     
      expect(user.is_password?("bad_password")).to eq(false)
    end
  end

  describe "::create_session_token" do 
    it "generates a session token by using SecureRandom" do 
      expect(User.create_session_token).not_to be_nil
    end
  end

  describe "#reset_session_token!" do
    it "generates new session token for session_token" do 
      user.valid?
      old = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old)
    end

    it "saves it in database" do 
      user.valid?
      user.reset_session_token!
      expect(User.find_by(email: "jonathan@fakesite.com").session_token).to eq(user.session_token)
    end

    it "returns a new session token" do 
      user.valid? 
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do 
    before { user.save! }
    it "should return nil if given bad credentials" do 
    
      expect(User.find_by_credentials("arash@pdx", "1234567")).to eq(nil)
    end

    it "should return user if given correct credentials" do 
    
      expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
    end
    
  end
  

 
end
