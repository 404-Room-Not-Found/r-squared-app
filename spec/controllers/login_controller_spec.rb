require 'rails_helper'

RSpec.describe LoginController, type: :controller do
  
    before(:each) do
        @user = User.new(name: "Example User", email: "user@example.com", password: "1234")
    end
    
    it "name should be present" do
    @user.name = ""
    expect(@user).to_not be_valid
    end
    
    it "email should be present" do
    @user.email = "     "
    expect(@user).to_not be_valid
    end
    
    it "is not valid without an email" do
      @user = build(:user, email: nil)
      expect(@user).to_not be_valid
    end
    
     it "is not valid without a password" do 
      @user = build(:user, password: nil)
      expect(@user).to_not be_valid
    end
end
