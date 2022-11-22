require 'rails_helper'

describe 'Authentication', type: :request do
    describe 'POST /authenticate' do
        it 'authenticates the client' do
            post '/api/users', params: { name: 'steve', email: 'steve@test.com', username: 'steve', password: 'password', password_confirmation: 'password'}

            expect(response).to have_http_status(:created)
            expect(JSON.parse(response.body)).to include(
                "username" && "token"
            )
        end

        it 'returns error when username is missing' do
            post '/api/users', params: { name: 'steve', email: 'steve@test.com', password: 'password', password_confirmation: 'password'}

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to include(
                "errors" => ["Username can't be blank"]
            )
        end

        it 'returns error when email is missing' do
            post '/api/users', params: { name: 'steve', username: 'steve', password: 'password', password_confirmation: 'password'}

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to include(
                "errors" => ["Email can't be blank"]
            )
        end

        it 'returns error when password is missing' do
            post '/api/users', params: { name: 'steve', username: 'steve', email: 'steve@test.com'}

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to include(
                "errors" => ["Password can't be blank"]
            )
        end
    end
end