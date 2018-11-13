require 'rails_helper'

RSpec.describe TwistsController, type: :controller do
  # things to test:
    # given a certain request, render or redirect appropriately

  describe 'GET#index' do
    let(:user) { create :user }
    it 'renders the twists index' do
      allow(subject).to receive(:current_user).and_return(user)
      # the subject referes to the controller itself
      # we need to do this to simulate being logged in
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET#show' do
    let(:user) { create :user }
    let!(:twist) { create :twist }
    it 'renders the show page for a twist' do
      allow(subject).to receive(:current_user).and_return(user)
      get :show, params: { id: twist.id }
      expect(response).to render_template('show')
    end
  end

  describe 'DELETE#destroy' do
    let(:current_user) { create :user }
    let!(:twist) { create :twist, author: current_user } # you can override default values set by the factory definition like so
    before :each do
      allow(subject).to receive(:current_user).and_return(current_user)
      delete :destroy, params: { id: twist.id }
    end

    it 'destroys the twist' do
      expect(Twist.exists?(twist.id)).to be false
      # twist ruby object still exists in memory, it's just not in the db anymore
    end

    it 'redirects to the twists index' do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(twists_url)
    end
  end

  describe 'POST#create' do
    before :each do
      create :user
      allow(subject).to receive(:current_user).and_return(User.last)
    end
    let(:valid_params) { {twist: { body: "does twisting make me a twister?" } } }
    let(:invalid_params) { {twist: { nada: "does twisting make me a twister?" } } }


    context 'with valid params' do
      it 'creates a twist' do
        post :create, params: valid_params
        expect(Twist.last.body).to eq "does twisting make me a twister?"
      end

      it 'redirects to twist show page' do
        post :create, params: valid_params
        expect(response).to redirect_to(twist_url(Twist.last.id))
      end
    end

    context 'with invalid params' do
      before :each do
        post :create, params: invalid_params
      end

      it 'redirects to the new_twist_url' do
        expect(response).to have_http_status(422)
        expect(response).to render_template(:new)
      end

      it 'adds errors to flash' do
        expect(flash[:errors]).to be_present
      end
    end
  end

end
