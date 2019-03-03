require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) do 
   FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end

  describe "GET #new" do
    it "render the new template" do 
      get :new, {}
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do 
    context "with valid params" do 
      it "save the new created user" do 
        post :create, params: {user: {email: "abc#pdx.edu", password: "good_pass"}}
        expect(response).to render_template(:show)
      end
    end

    context "with invalid params" do 
      it "should render the new template" do 
        post :create, params: {user: {email: "abc#pdx.edu"}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe "GET #index" do 
    it "render the index template" do 
      get :index, {}
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do 
    before {user.save}
    context "can find the user" do 
      it "renders the show template" do 
        # get :show, params: { user: { email: "jonathan@fakesite.com", password: "good_password" }}
        get :show, params: {id: user.id}
        expect(response).to render_template(:show)
        expect(response).to have_http_status(200)
      end
    end

    context "user doesn't exist in database" do 
      it "should render the new template" do 
        # get :show, params: { user: { email: "jon@fake.com", password: "good_password" }}
        get :show, params: {id: 2}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

end
