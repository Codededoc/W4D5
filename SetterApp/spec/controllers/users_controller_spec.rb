require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'renders the login page' do
      get :new

      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    before :each do
      create :user
    end
    let(:valid_params) {{user: {username: 'Ginny', password: 'hogwarts'} } }
    let(:invalid_params) {{user: {hello: 'hello', password: 'hogwarts'} } }

    context 'with valid params' do
      it 'should redirect to login page' do
        post :create, params: valid_params
        expect(response).to redirect_to(user_url(User.last.id))
      end
    end

    context 'with invalid params' do
      before :each do
        post :create, params: invalid_params
      end

      it 'should add errors to flash' do
        expect(flash[:errors]).to be_present
      end
      it 'should render the login page' do
        get :new

        expect(response).to render_template('new')
        expect(response).to have_http_status(200)
      end
    end
  end

end
