require 'spec_helper'

describe WorkdaysController, type: :controller do
  let(:user) { create(:user) }
  let(:workday) { double(id: 1) }
  let(:punches) { [double] }

  def valid_attributes
    { day: Time.now.to_s }
  end

  before(:each) { sign_in user }

  describe "GET index" do
    context "when the current user has a punch" do
      let(:a_punch) { create(:punch) }
      let(:another_punch) { create(:other_punch) }
      let(:workday) { a_punch.workday }
      before do
        2.times do
          Punch.create(time: Time.now, user_id: user.id, workday_id: workday.id)
        end
      end
      it "assigns all workdays of the current user as @workdays" do
        get :index, {date: '2013-04'}

        expect(assigns(:presenter)).to have(1).workdays
      end

      describe "performing default search with current date" do
        current_time = Time.zone.now
        year = current_time.year
        month = (current_time.month).to_s.rjust(2, '0')

        context "when has no params" do
          it "assigns default date parameter with the current time" do
            get :index

            expect(assigns(:date)).to eq "#{year}-#{month}"
          end
        end
        context "when params is empty" do
          it "assigns default date parameter" do
            get :index, {date: nil}

            expect(assigns(:date)).to eq "#{year}-#{month}"
          end
        end
      end
    end

  end

  describe "GET show" do
    it "assigns the requested workday as @workday" do
      allow(Workday).to receive(:find).with('1') { workday }
      allow(Punch).to receive(:all_by).with(anything) { punches }

      get :show, {:id => '1'}

      expect(assigns(:presenter)).to be_a WorkdayPresenter
    end
  end

  describe "GET new" do
    it "assigns a new workday as @workday" do
      get :new, {}

      expect(assigns(:workday)).to be_a_new(Workday)
    end
  end

  describe "GET edit" do
    it "assigns the requested workday as @workday" do
      allow(Workday).to receive(:find).with("1") { workday }

      get :edit, {:id => "1"}

      expect(assigns(:workday)).to eq(workday)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Workday" do
        expect {
          post :create, {:workday => valid_attributes}
        }.to change(Workday, :count).by(1)
      end

      it "assigns a newly created workday as @workday" do
        post :create, {:workday => valid_attributes}

        expect(assigns(:workday)).to be_a(Workday)
        expect(assigns(:workday)).to be_persisted
      end

      it "redirects to the created workday" do
        post :create, {:workday => valid_attributes}

        expect(response).to redirect_to(Workday.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workday as @workday" do
        allow(Workday.any_instance).to receive(:save).and_return(false)

        post :create, {:workday => {}}

        expect(assigns(:workday)).to be_a_new(Workday)
      end

      it "re-renders the 'new' template" do
        allow(Workday.any_instance).to receive(:save).and_return(false)

        post :create, {:workday => {}}

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:workday) { create(:workday) }

      it "assigns the requested workday as @workday" do
        put :update, {:id => workday.id, :workday => valid_attributes}

        expect(assigns(:workday)).to eq(workday)
      end

      it "redirects to the workday" do
        put :update, {:id => workday.id, :workday => valid_attributes}

        expect(response).to redirect_to(workday)
      end
    end

    describe "with invalid params" do
      before(:each) do
        allow(Workday).to receive(:find).with("1") { workday }
        allow(workday).to receive(:update_attributes).with(anything) { false }
      end

      it "assigns the workday as @workday" do
        put :update, {:id => '1', :workday => {}}

        expect(assigns(:workday)).to eq(workday)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => '1', :workday => {}}

        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested workday" do
      workday = create(:workday)
      expect {
        delete :destroy, {:id => workday.id}
      }.to change(Workday, :count).by(-1)
    end

    it "redirects to the workdays list" do
      workday = create(:workday)

      delete :destroy, {:id => workday.id}

      expect(response).to redirect_to(workdays_url)
    end
  end

end
