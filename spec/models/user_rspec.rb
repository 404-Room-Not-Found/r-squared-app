
require "rails_helper"

RSpec.describe User, :type => :model do
  
  before(:all) do
    @user1 = User.new(name: "Example User", email: "user@example.com", password: "1234")
  end
  
    it "is valid with valid attributes" do
      expect(@user1).to be_valid
    end
    
    it "name should not be too long" do
      @user1.name = "a" * 51
      expect(@user1).to_not be_valid
    end

    it "email should not be too long" do
      @user1.name = "Example User"
      @user1.email = "a" * 244 + "@example.com"
      expect(@user1).to_not be_valid
    end
    
    it "name should be present" do
    @user1.name = ""
    expect(@user1).to_not be_valid
    end

    it "email should be present" do
    @user1.email = "     "
    expect(@user1).to_not be_valid
    end
    
    it "is valid after updating" do
      @user1.name = "Example User"
      @user1.email = "user@example.com"
      expect(@user1).to be_valid
    end
    
    it "is not valid without a password" do 
      user2 = build(:user, password: nil)
      expect(user2).to_not be_valid
    end
    
    it "is not valid without a username" do 
      user2 = build(:user, name: nil)
      expect(user2).to_not be_valid
    end
    
    it "is not valid without an email" do
      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid
    end
end