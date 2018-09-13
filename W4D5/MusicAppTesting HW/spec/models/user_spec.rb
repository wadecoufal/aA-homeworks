require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end

  subject(:user) { User.new(email: 'w@gmail.com', password: 'starwars') }

  describe "#reset_session_token!" do
    it "should reset users session token" do
      original_session_token = user.session_token
      new_session_token = user.reset_session_token!
      expect(new_session_token).to_not eq(original_session_token)
    end

    it "should save the users new session token to the database" do
      expect(user).to receive(:save!)
      user.reset_session_token!
    end

    it "should set password to an instance variable" do
    end

    it "should set password_digest" do
      old_password_digest = user.password_digest
      user.password = 'newpassword'
      expect(user.password_digest).to_not eq(old_password_digest)
    end
  end

  describe "::find_by_credentials" do
    before(:each) do
      user.save!
    end
    it "returns the user if they are within the database" do
      expect(User.find_by_credentials('w@gmail.com', 'starwars')).to eq(user)
    end

    it "returns nil if the user is not within the database" do
      expect(User.find_by_credentials('wwww@gmail.com', 'randompassword')).to be_nil
    end

  end

  describe "#is_password?" do
    it "returns true if password passed in matches user password" do
      expect(user.is_password?('starwars')).to be(true)
    end

    it "returns false if password passed in does not match user password" do
      expect(user.is_password?("djdjalkj")).to be(false)
    end
  end


end
