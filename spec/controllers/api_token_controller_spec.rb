describe ApiTokenController, type: :controller do
  describe 'GET index' do
    render_views

    it 'renders users api token' do
      user = create(:user)
      sign_in user

      get 'index'

      expect(response).to be_success
      expect(response.body).to match /#{user.api_token}/
    end
  end
end
