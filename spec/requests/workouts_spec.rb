require 'rails_helper'

describe 'Workouts API', type: :request do
    let(:user) { FactoryBot.create(:user, username: 'steve', email: 'steve', password: 'password', password_confirmation: 'password')}
    let(:token_new) { JsonWebToken.encode(user_id: @user.id) }
    let(:token) do
        {  "Authorization" => "Bearer #{token_new}"  }
    end
    it 'returns all workouts' do
        get '/api/workouts', params: { headers: token}

        # expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to include(
            "errors" => ["Password can't be blank"])
    end
end