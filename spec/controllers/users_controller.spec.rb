require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it 'renders registration form' do
      get :new
      expect(response).to render_template('users/new')
    end

    it 'will return a 200 code' do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
