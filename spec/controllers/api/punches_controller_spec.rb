describe Api::PunchesController, type: :controller do
  context 'when no token is provided' do
    it 'should be unauthorized' do
      request_with_token(nil)
      get :index, format: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'when an invalid token is provided' do
    it 'should be unauthorized' do
      request_with_token('invalid_token')
      get :index, format: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'with a valid token' do
    it 'should allow access' do
      request_with_token(create(:user).api_token)
      get :index, format: :json
      expect(response).to be_ok
    end
  end

  describe 'POST create' do
    let(:user) { create(:user) }
    it 'should create punch for user who provided api token' do
      request_with_token(user.api_token)
      expect { post :create, format: :json }.to change(user.punches, :count).by(1)
    end

    it 'should include punch data on response body' do
      request_with_token(user.api_token)
      post :create, format: :json
      created_punch = user.punches.first
      response_body = JSON.parse(response.body).symbolize_keys
      expect(response_body[:id]).to eq(created_punch.id)
      expect(Time.parse(response_body[:time])).to be_within(1.second).of created_punch.time
    end

    it 'should create punch with current time if none is provided' do
      now = Time.now
      allow(Time).to receive(:now).and_return(now)
      request_with_token(user.api_token)

      post :create, format: :json

      created_punch = user.punches.first.time
      expect(created_punch.time).to be_within(1.second).of created_punch.time
    end

    it 'should create punch with time if provided' do
      punch_time = 5.minutes.ago
      request_with_token(user.api_token)

      post :create, time: punch_time, format: :json

      created_punch = user.punches.first.time
      expect(created_punch.time).to be_within(1.second).of created_punch.time
    end

    it 'should return bad request if invalid punch' do
      request_with_token(user.api_token)

      post :create, time: 'invalid_value', format: :json

      expect(response).to have_http_status(:bad_request)
    end
  end

  def request_with_token(token)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
end
