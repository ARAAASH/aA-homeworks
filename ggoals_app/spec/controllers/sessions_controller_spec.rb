require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  subject(:user) do 
    FactoryBot.build(:user, 
      email: "ash@pdx.com",
      password: "good_secret"
    )
  end

  describe "GET #new" do 
    it "renders new templates" do 
      get :new, {}
      expect(response).to render_template(:new)
      expect(response).to have_http_staus(200)
    end
  end

  describe "POST #create" do 
    context "valid params given" do 
      it "should goes to users show page" do
        post :create, params: {session: {email: "ash@pdx.com", password: "good_secret"}}
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "invalid params given" do 
      it "should render new template" do 
        post :create, params: {session: {email: "abcd"}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

end
