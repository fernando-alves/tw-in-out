describe PunchesController, type: :controller do
  let(:punch) { create(:punch) }
  let(:workday) { create(:workday) }

  let(:attributes) do
    { 'time' => '2013-01-01 09:00:00', 'workday_id' => "#{workday.id}" }
  end

  before(:each) { sign_in create(:user) }

  describe 'GET index' do
    before { get :index }

    it { expect(response).to redirect_to workdays_path }
  end

  describe 'GET show' do
    before { get :show, id: punch.id }

    it { expect(assigns(:punch)).to eq(punch) }
  end

  describe 'GET new' do
    before { get :new }

    it { expect(assigns(:punch)).to be_a_new(Punch) }
  end

  describe 'GET edit' do
    before { get :edit, id: punch.id }

    it { expect(assigns(:punch)).to eq(punch) }
  end

  describe 'POST create' do
    subject(:create_punch) { post :create, punch: attributes }
    let(:attributes) do
      { 'time' => '2013-01-01 09:00:00', 'workday_id' => "#{workday.id}" }
    end

    it { expect { create_punch }.to change(Punch, :count).by(1) }
    it { expect(create_punch).to redirect_to(Punch.last) }
  end

  describe 'PUT update' do
    subject(:update_punch) { put :update, id: punch.id, punch: attributes }

    it 'assigns punch' do
      update_punch

      expect(assigns(:punch)).to eq(punch)
    end

    it { expect(update_punch).to redirect_to(punch) }

    describe 'with invalid params' do
      let(:invalid_punch) { double(update_attributes: false) }

      before do
        allow(Punch).to receive(:find)
          .and_return(invalid_punch)

        update_punch
      end

      it { expect(response).to render_template('edit') }
    end
  end

  describe 'DELETE destroy' do
    subject(:delete_punch) { delete :destroy, id: punch.id }

    let(:punch) { build(:punch) }
    let(:workday) { punch.workday }

    before { punch.save! }

    it { expect { delete_punch }.to change(Punch, :count).by(-1) }
    it { expect(delete_punch).to redirect_to(workday) }
  end
end
