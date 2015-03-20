require 'spec_helper'

describe WorkdaysController, type: :controller do
  let(:user) { create(:user) }
  let(:workday) { double(id: 1) }
  let(:punches) { [double] }

  def valid_attributes
    { day: Time.now.to_s }
  end

  before { sign_in user }

  describe 'GET index' do
    let(:params) { {} }
    let(:current_time) { Time.zone.now }
    let(:year) { current_time.year }
    let(:month) { (current_time.month).to_s.rjust(2, '0') }

    context 'when has no params' do
      it 'assigns default date parameter with the current time' do
        get :index

        expect(assigns(:date)).to eq "#{year}-#{month}"
      end
    end

    context 'when params is empty' do
      let(:params) { { date: nil } }

      it 'assigns default date parameter' do
        get :index, params

        expect(assigns(:date)).to eq "#{year}-#{month}"
      end
    end

    context 'when the current user has a punch' do
      let(:workday) { create(:punch).workday }
      let(:params) { { date: '2013-04' } }

      before do
        2.times {
          Punch
            .create(
              time: Time.now,
              user_id: user.id,
              workday_id: workday.id
            )
        }
      end

      it 'assigns all workdays of the current user as @workdays' do
        get :index, params

        expect(assigns(:presenter)).to have(1).workdays
      end
    end

  end

  describe 'GET show' do
    let(:workday_id) { '1' }

    before do
      allow(Workday).to receive(:find)
        .with(workday_id)
        .and_return(workday)

      allow(Punch).to receive(:all_by)
        .and_return(punches)
    end

    it 'assigns the requested workday' do
      get :show, { :id => workday_id }

      expect(assigns(:presenter)).to be_a WorkdayPresenter
    end
  end

  describe 'GET new' do
    it 'assigns a new workday as @workday' do
      get :new, {}

      expect(assigns(:workday)).to be_a_new(Workday)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested workday as @workday' do
      allow(Workday).to receive(:find).with('1') { workday }

      get :edit, {:id => '1'}

      expect(assigns(:workday)).to eq(workday)
    end
  end

  describe 'POST create' do
    it 'creates a new Workday' do
      expect {
        post :create, { workday: valid_attributes }
      }.to change(Workday, :count).by(1)
    end

    it 'assigns a newly created workday' do
      post :create, { workday: valid_attributes }

      expect(assigns(:workday)).to be_persisted
    end

    it 'redirects to the created workday' do
      post :create, { workday: valid_attributes }

      expect(response).to redirect_to(Workday.last)
    end

    describe 'with invalid params' do
      let(:workday) { Workday.new }

      before do
        allow(Workday).to receive(:find_or_create_by_day)
          .and_return(workday)
      end

      it 'assigns a newly created but unsaved workday as @workday' do
        post :create, { workday: {} }

        expect(assigns(:workday)).to be_a_new(Workday)
      end

      it 're-renders a template' do
        post :create, { workday: {} }

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    let(:workday) { create(:workday) }
    let(:params) { { id: workday.id,  workday: valid_attributes } }

    it 'assigns the requested workday as @workday' do
      put :update, params

      expect(assigns(:workday)).to eq(workday)
    end

    it 'redirects to the workday' do
      put :update, params

      expect(response).to redirect_to(workday)
    end

    describe 'with invalid params' do
      let(:params) { { id: workday_id,  workday: {} } }
      let(:workday_id) { '1' }

      before do
        allow(Workday).to receive(:find)
          .with(workday_id)
          .and_return(workday)

        allow(workday).to receive(:update_attributes)
          .and_return(false)
      end

      it 'assigns the workday' do
        put :update, params

        expect(assigns(:workday)).to eq(workday)
      end

      it 're-renders a template' do
        put :update, params

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested workday' do
      workday = create(:workday)
      expect {
        delete :destroy, {:id => workday.id}
      }.to change(Workday, :count).by(-1)
    end

    it 'redirects to the workdays list' do
      workday = create(:workday)

      delete :destroy, {:id => workday.id}

      expect(response).to redirect_to(workdays_url)
    end
  end

end
