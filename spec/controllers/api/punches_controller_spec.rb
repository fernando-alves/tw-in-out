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

  def request_with_token(token)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
end
