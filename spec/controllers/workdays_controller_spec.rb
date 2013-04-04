require 'spec_helper'

describe WorkdaysController do

  let(:workday) { mock_model(Workday, id: 1) }

  def valid_attributes
    { day: Time.now }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkdaysController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all workdays as @workdays" do
      workday = Workday.create! valid_attributes
      get :index, {}, valid_session
      assigns(:workdays).should eq([workday])
    end
  end

  describe "GET show" do
    it "assigns the requested workday as @workday" do
      Workday.stub(:find).with("1") { workday }
      get :show, {:id => workday.to_param}, valid_session
      assigns(:workday).should eq(workday)
    end
  end

  describe "GET new" do
    it "assigns a new workday as @workday" do
      get :new, {}, valid_session
      assigns(:workday).should be_a_new(Workday)
    end
  end

  describe "GET edit" do
    it "assigns the requested workday as @workday" do
      Workday.stub(:find).with("1") { workday }
      get :edit, {:id => workday.to_param}, valid_session
      assigns(:workday).should eq(workday)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "should built a new Workday with valid attributes" do
        Workday.stub(:new).with(anything) { workday }
        workday.stub(:save) { true }
        Workday.should_receive(:new).with(valid_attributes)
        post :create, {:workday => valid_attributes}
      end
      it "creates a new Workday" do
        expect {
          post :create, {:workday => valid_attributes}, valid_session
        }.to change(Workday, :count).by(1)
      end

      it "assigns a newly created workday as @workday" do
        post :create, {:workday => valid_attributes}, valid_session
        assigns(:workday).should be_a(Workday)
        assigns(:workday).should be_persisted
      end

      it "redirects to the created workday" do
        post :create, {:workday => valid_attributes}, valid_session
        response.should redirect_to(Workday.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workday as @workday" do
        Workday.any_instance.stub(:save).and_return(false)
        post :create, {:workday => {}}, valid_session
        assigns(:workday).should be_a_new(Workday)
      end

      it "re-renders the 'new' template" do
        Workday.any_instance.stub(:save).and_return(false)
        post :create, {:workday => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested workday" do
        Workday.stub(:find).with("1") { workday }
        workday.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => workday.to_param, :workday => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested workday as @workday" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes).with(workday.to_param) { true }
        valid_attributes = workday
        put :update, {:id => workday.to_param, :workday => valid_attributes}, valid_session
        assigns(:workday).should eq(workday)
      end

      it "redirects to the workday" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes).with(workday.to_param) { true }
        valid_attributes = workday
        put :update, {:id => workday.to_param, :workday => valid_attributes}, valid_session
        response.should redirect_to(workday)
      end
    end

    describe "with invalid params" do
      it "assigns the workday as @workday" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes) { false }
        put :update, {:id => workday.to_param, :workday => {}}, valid_session
        assigns(:workday).should eq(workday)
      end

      it "re-renders the 'edit' template" do
        Workday.stub(:find).with("1") { workday }
        workday.stub(:update_attributes) { false }
        put :update, {:id => workday.to_param, :workday => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested workday" do
      workday = Workday.create! valid_attributes
      expect {
        delete :destroy, {:id => workday.to_param}, valid_session
      }.to change(Workday, :count).by(-1)
    end

    it "redirects to the workdays list" do
      Workday.stub(:find).with("1") { workday }
      delete :destroy, {:id => workday.to_param}, valid_session
      response.should redirect_to(workdays_url)
    end
  end

end
