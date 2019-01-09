require 'rails_helper'
   
describe SessionsController do
    describe 'GET #new' do
        it "renders the login page" do
          get :new
          expect(response).to render_template('sessions/new')
        end
        
        it "session id matches login id" do
            get :new
            @user = User.find_by(email: 'avoneiff@gmail.com')
            @current_user ||= User.find_by(id: session[:user_id])
            expect(@user).to eq(@current_user)
        end
    end
end
 

#RSpec.describe SessionsController, type: :controller do

   
    #it "login should be successful" do
     ## @user1 = User.new(name: "Anthony", email: "avoneiff@gmail.com", password: "1234")
     # @session = SessionsController.new()
      #@session.log_in(@user1)
   # end
  
   # it "seesion should find the right user" do
    #  get :show, :id => @user.id
   #   assigns(:user).should == @user
   # end
    
#end