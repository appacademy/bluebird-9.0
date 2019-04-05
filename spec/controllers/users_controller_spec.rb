require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new users template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:new_user_params) { FactoryBot.attributes_for(:user) }

    context 'with valid params' do
      it 'logs the user in' do
        post :create, params: { user: new_user_params }

        user = User.last
        expect(user.session_token).to eq(session[:session_token])
      end

      it "redirects to the user's show page" do
        post :create, params: { user: new_user_params }

        user = User.last
        expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid params' do
      it 'renders the new template with errors' do
        post :create, params: {
          user: FactoryBot.attributes_for(:user, password: '') }

        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end
end
