require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'GET /Game/{id}' do
    let!(:game) { create(:game) }

    it 'should return a game' do
      get "/games/#{game.id}"
      expect(payload).to_not be_empty
      expect(payload['id']).to eq(game.id)
      expect(payload['num_row']).to eq(game.num_row)
      expect(payload['num_column']).to eq(game.num_column)
      expect(payload['num_mine']).to eq(game.num_mine)
      expect(response).to have_http_status(200)
    end

    it 'Should return error message on invalid game' do
      get '/games/100'
      expect(payload).to_not be_empty
      expect(payload['error']).to_not be_empty
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /games' do
    it 'should create a game' do
      req_payload = {
        game: {
          num_row: 5,
          num_column: 5,
          num_mine: 5,
          is_active: true
        }
      }
      post '/games', params: req_payload
      expect(payload).to_not be_empty
      expect(payload['id']).to_not be_nil
      expect(payload['num_mine']).to eq(req_payload[:game][:num_mine])
      expect(payload['num_column']).to eq(req_payload[:game][:num_column])
      expect(payload['num_row']).to eq(req_payload[:game][:num_row])
      expect(payload['positions'].size).to eq(req_payload[:game][:num_row] * req_payload[:game][:num_column])
      expect(payload['positions'].select { |m| m[:has_mine] == true }.size).to eq(req_payload[:game][:num_mine])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /games/{id}/positions/{id}' do
    let!(:game) { create(:game) }
    let!(:position) { create(:position,x: 0, y: 0, state: :covered, has_mine: false, value: 0, game_id: game.id) }
    it 'should update a position' do
      req_payload_update = {
        position: {
          state: 'flagged'
        }
      }
      put "/games/#{game.id}/positions/#{position.id}", params: req_payload_update
      expect(payload).to_not be_empty
      expect(response).to have_http_status(:ok)
    end
  end

  private

  def payload
    JSON.parse(response.body).with_indifferent_access
  end
end
