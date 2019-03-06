require 'rails_helper'

describe HomeController do render_views



 describe "GET #index" do
  before do
    get :index
  end
  
  it "returns http success" do
    expect(response).to have_http_status(302)
  end

    
 end

end
