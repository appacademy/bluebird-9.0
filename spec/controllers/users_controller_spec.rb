require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # actions 
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        post :create, params: {
          user: FactoryBot.attributes_for(:user)
        }        
      end

      it "logs in a new user" do
        user = User.last #if there are no other tests running
        expect(session[:session_token]).to eq(user.session_token)
      end
      
      it "redirects to user show page" do
        user = User.last #if there are no other tests running
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with not valid params" do
      before(:each) do
        post :create, params: {
          user: FactoryBot.attributes_for(:user, password: "")
        }        
      end

      it "renders the :new template" do
        expect(response).to render_template(:new)
      end

      it "displays the errors" do
        expect(flash[:errors]).to be_present
      end
    end
  end
end