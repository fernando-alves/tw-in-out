require 'spec_helper'

describe WorkdaysController do
  login
  let(:workday) { mock_model(Workday, id: 1) }
  let(:punches) { [mock_model(Punch)] }

  def valid_attributes
    { day: Time.now.to_s }
  end

  describe "GET index" do
    context "when the current user has a punch" do
      let(:a_punch) { create(:punch) }
      let(:another_punch) { create(:other_punch) }
      let(:workday) { a_punch.workday }
      before do
        2.times do
          Punch.create(time: Time.now, kind: "IN", user_id: @current_user.id, workday_id: workday.id)
        end
      end
      it "assigns all workdays of the current user as @workdays" do
        get :index
        assigns(:workdays).size.should == 1
      end
    end
  end

  describe "GET show" do
    it "assigns the requested workday as @workday" do
      Workday.stub(:find).with("1") { workday }
      Punch.stub(:all_by).with(anything) { punches }
      get :show, {:id => workday.to_param}
      assigns(:presenter).should be_a WorkdayPresenter
    end
  end

  describe "GET new" do
    it "assigns a new workday as @workday" do
      get :new, {}
      assigns(:workday).should be_a_new(Workday)
    end
  end

  describe "GET edit" do
    it "assigns the requested workday as @workday" do
      Workday.stub(:find).with("1") { workday }
      get :edit, {:id => workday.to_param}
      assigns(:workday).should eq(workday)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "should built a new Workday with valid attributes" do
        Workday.stub(:find_or_create_by_day).with(anything) { workday }
        Workday.should_receive(:find_or_create_by_day).with(valid_attributes[:day])
        post :create, {:workday => valid_attributes}
      end
      it "creates a new Workday" do
        expect {
          post :create, {:workday => valid_attributes}
        }.to change(Workday, :count).by(1)
      end

      it "assigns a newly created workday as @workday" do
        post :create, {:workday => valid_attributes}
        assigns(:workday).should be_a(Workday)
        assigns(:workday).should be_persisted
      end

      it "redirects to the created workday" do
        post :create, {:workday => valid_attributes}
        response.should redirect_to(Workday.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workday as @workday" do
        Workday.any_instance.stub(:save).and_return(false)
        post :create, {:workday => {}}
        assigns(:workday).should be_a_new(Workday)
      end

      it "re-renders the 'new' template" do
        Workday.any_instance.stub(:save).and_return(false)
        post :create, {:workday => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested workday" do
        Workday.stub(:find).with("1") { workday }
        workday.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => workday.to_param, :workday => {'these' => 'params'}}
      end

      it "assigns the requested workday as @workday" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes).with(workday.to_param) { true }
        valid_attributes = workday
        put :update, {:id => workday.to_param, :workday => valid_attributes}
        assigns(:workday).should eq(workday)
      end

      it "redirects to the workday" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes).with(workday.to_param) { true }
        valid_attributes = workday
        put :update, {:id => workday.to_param, :workday => valid_attributes}
        response.should redirect_to(workday)
      end
    end

    describe "with invalid params" do
      it "assigns the workday as @workday" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes) { false }
        put :update, {:id => workday.to_param, :workday => {}}
        assigns(:workday).should eq(workday)
      end

      it "re-renders the 'edit' template" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes) { false }
        put :update, {:id => workday.to_param, :workday => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested workday" do
      workday = Workday.create! valid_attributes
      expect {
        delete :destroy, {:id => workday.to_param}
      }.to change(Workday, :count).by(-1)
    end

    it "redirects to the workdays list" do
      Workday.stub(:find).with("1") { workday }
      delete :destroy, {:id => workday.to_param}
      response.should redirect_to(workdays_url)
    end
  end

end
