require 'rails_helper'

describe 'Fitalytics API', type: :request do
    let!(:user) {FactoryBot.create(:user, name: 'Steve', username: 'Steve', email: 'steve@test.com', password: 'password')}
    before do
        allow(JsonWebToken).to receive(:decode).and_return(user.id)
    end
    it 'returns all workouts' do
        
        # FactoryBot.create(:workout, category_id: "2", description: "Running", distance: "1km", time: "12:30", avg_bpm: "110")
        # FactoryBot.create(:workout, category_id: "4", description: "Running again", distance: "3km", time: "15:30", avg_bpm: "140")
        

        

        post '/api/workouts', params: {
            category_id: "4",
            description: "Running again",
            distance: "3km",
            time: "15:30",
            avg_bpm: "140"
        }

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
    end
end