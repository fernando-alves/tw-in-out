describe WorkdaysController, type: :controller do
  let(:user) { create(:user) }
  let(:workday_id) { '1' }
  let(:workday) { double(id: workday_id) }
  let(:punches) { [double] }

  let(:attributes) do
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

    context 'when there is more than one punch' do
      let(:workday) { create(:punch).workday }
      let(:params) { { date: '2013-04' } }

      before do
        2.times do
          Punch
            .create(
              time: Time.now,
              user_id: user.id,
              workday_id: workday.id
            )
        end

        get :index, params
      end

      it { expect(assigns(:presenter)).to have(1).workdays }
    end
  end

  describe 'GET show' do
    subject(:show_workday) { get :show, id: workday_id }

    before do
      allow(Workday).to receive(:find)
        .with(workday_id)
        .and_return(workday)

      allow(Punch).to receive(:all_by)
        .and_return(punches)

      show_workday
    end

    it { expect(assigns(:presenter)).to be_a WorkdayPresenter }
  end

  describe 'GET new' do
    before { get :new }

    it { expect(assigns(:workday)).to be_a_new(Workday) }
  end

  describe 'GET edit' do
    subject(:edit_workday) { get :edit, id: workday_id }

    before do
      allow(Workday).to receive(:find)
        .with(workday_id)
        .and_return(workday)

      edit_workday
    end

    it { expect(assigns(:workday)).to eq(workday) }
  end

  describe 'POST create' do
    subject(:create_workday) { post :create, workday: attributes }

    it { expect { create_workday }.to change(Workday, :count).by(1) }
    it { expect(create_workday).to redirect_to(Workday.last) }

    describe 'with invalid params' do
      let(:workday) { Workday.new }

      before do
        allow(Workday).to receive(:find_or_create_by)
          .and_return(workday)

        create_workday
      end

      it { expect(assigns(:workday)).to be_a_new(Workday) }
      it { expect(response).to render_template('new') }
    end
  end

  describe 'PUT update' do
    subject(:update_workday) { put :update, params }

    let(:workday) { create(:workday) }
    let(:params) { { id: workday.id, workday: attributes } }

    it 'assigns workday' do
      update_workday

      expect(assigns(:workday)).to eq(workday)
    end

    it { expect(update_workday).to redirect_to(workday) }

    describe 'with invalid params' do
      let(:invalid_workday) { double(update_attributes: false) }

      before do
        allow(Workday).to receive(:find)
          .and_return(invalid_workday)

        update_workday
      end

      it { expect(response).to render_template('edit') }
    end
  end

  describe 'DELETE destroy' do
    subject(:delete_workday) { delete :destroy, id: workday.id }

    let(:workday) { build(:workday) }

    before { workday.save }

    it { expect { delete_workday }.to change(Workday, :count).by(-1) }
    it { expect(delete_workday).to redirect_to(workdays_url) }
  end
end
