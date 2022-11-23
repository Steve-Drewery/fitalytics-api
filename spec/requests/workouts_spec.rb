require 'rails_helper'

describe 'Workouts API', type: :request do
    let(:workouts) { FactoryBot.create(:workouts, description: "bench", time: "60", avg_bpm: "120", date: "2022-11-21", category_id: "1")}
    let!(:user) { FactoryBot.create(:user, username: 'steve', email: 'steve', password: 'password', password_confirmation: 'password')}
    let(:token_new) { JsonWebToken.encode(user_id: user.id) }
    let(:token) do
        {  "Authorization": "Bearer #{token_new}"  }
    end

    it 'get all workouts' do
        get '/api/workouts',  headers: token

        expect(response).to have_http_status(:success)
    end
end