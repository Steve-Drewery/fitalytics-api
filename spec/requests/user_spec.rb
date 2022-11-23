require 'rails_helper'

describe 'Users', type: :request do
    describe 'POST /authenticate/login' do
        let(:user) { FactoryBot.create(:user, username: 'steve', email: 'steve', password: 'password', password_confirmation: 'password')}
        
        # Recieves a token and username to authenticate user login
        it 'authenticates the login' do
            post '/api/auth/login', params: { email: user.username, password: 'password'}

            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body)).to include(
                "token" && "username"
            )
        end
    end
end