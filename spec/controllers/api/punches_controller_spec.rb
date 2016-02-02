describe Api::PunchesController, type: :controller do
  before { request.env['HTTP_ACCEPT'] = 'application/json' }
  let(:user) { create(:user) }

  context 'when no token is provided' do
    it 'should be unauthorized' do
      request_with_token(nil)
      get :index
      expect(response).to have_http_status(:unauthorized)
      expect(response_body_as_json(response.body)[:message]).to match /unauthorized/i
    end
  end

  context 'when an invalid token is provided' do
    it 'should be unauthorized' do
      request_with_token('invalid_token')
      get :index
      expect(response).to have_http_status(:unauthorized)
      expect(response_body_as_json(response.body)[:message]).to match /unauthorized/i
    end
  end

  context 'with a valid token' do
    before { request_with_token(user.api_token) }

    it 'should allow access' do
      get :index
      expect(response).to be_ok
    end

    it 'should list punches for current workday' do
      punch_initial_time = Time.now
      workday = Workday.create(day: punch_initial_time)
      punches = create_punches_for_user(user, workday, punch_initial_time)
      allow(Workday).to receive(:find_or_create_by).with(anything()).and_return(workday)
      get :index
      expect(punches_from_response_body(response.body)).to match_array punches
    end
  end

  describe 'POST create' do
    let(:created_punch) { user.punches.first }
    before { request_with_token(user.api_token) }

    it 'should create punch for user who provided api token' do
      expect { post :create }.to change(user.punches, :count).by(1)
    end

    it 'should include punch data on response body' do
      post :create
      response_body = response_body_as_json(response.body)
      expect(response_body[:id]).to eq(created_punch.id)
      expect(Time.parse(response_body[:time])).to be_within(1.second).of created_punch.time
    end

    it 'should create punch with current time if none is provided' do
      now = Time.now
      allow(Time).to receive(:now).and_return(now)
      post :create
      expect(created_punch.time).to be_within(1.second).of created_punch.time
    end

    it 'should create punch with time if provided' do
      punch_time = 5.minutes.ago
      post :create, time: punch_time
      expect(created_punch.time).to be_within(1.second).of created_punch.time
    end

    it 'should return bad request if invalid punch' do
      post :create, time: 'invalid_value'
      expect(response).to have_http_status(:bad_request)
      expect(response_body_as_json(response.body)[:message]).to match /bad request/i
    end
  end

  def request_with_token(token)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  def response_body_as_json(response_body)
    JSON.parse(response_body).symbolize_keys
  end

  def punches_from_response_body(response_body)
    JSON.parse(response_body).collect { |punch_hash| Punch.find(punch_hash['id']) }
  end

  def create_punches_for_user(user, workday, initial_time)
    (1..3).collect { |offset| create(:punch, workday: workday, user: user, time: initial_time + offset.minutes) }
  end
end
