require 'rails_helper'

describe 'Authentication', type: :request do
    describe 'POST /login' do
        let(:user) { FactoryBot.create(:user, username: 'Steve', email: 'steve@test.com', password: 'password')}
        it 'authenticates the client' do
            post '/api/users', params: { name: "Steve323",
                username: "Steve323",
                email: "steve323@test.com",
                password: "password",
                password_confirmation: "password"}

            expect(response).to have_http_status(:created)
            expect(JSON.parse(response.body)).to include("token" && "username")
        end

        it 'returns error when username is missing' do
            post '/api/users', params: { password: 'password'}

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to eq("errors" => ["Email can't be blank", "Username can't be blank"])
        end

        it 'returns arror when password is missing' do
            post '/api/users', params: { username: 'Steve'}

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to eq("errors" => ["Password can't be blank", "Email can't be blank"])
        end

        it 'returns error when password is incorrect' do
            post '/api/auth/login', params: { email: user.email, password: 'incorrect'}

            expect(response).to have_http_status(:unauthorized)
        end
    end
end