require 'rails_helper'

describe 'Fitalytics API', type: :request do
    let(:user) {FactoryBot.create(:user, name: 'Steve', username: 'Steve', email: 'steve@test.com', password: 'password')}
    it 'returns user token' do
        

        post '/api/auth/login', params: { email: user.email, password: user.password }

        expect(response).to have_http_status(:ok)
    end
end