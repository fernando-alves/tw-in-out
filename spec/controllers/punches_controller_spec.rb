require 'spec_helper'

describe PunchesController do
  login
  let(:punch) { mock_model(Punch, id: 1) }
  let(:workday) { create(:workday) }

  def valid_attributes
    { "time"=> "2013-01-01 09:00:00", "kind"=> "IN", "workday_id" => "#{workday.id}" }
  end

  describe "GET show" do
    it "assigns the requested punch as @punch" do
      Punch.stub(:find).with("1") { punch }
      get :show, {:id => punch.to_param}
      assigns(:punch).should eq(punch)
    end
  end

  describe "GET new" do
    it "assigns a new punch as @punch" do
      get :new
      assigns(:punch).should be_a_new(Punch)
    end
    context "when it is the first punch of the day" do
      it "should prepare a new punch kind of IN" do
        get :new
        assigns(:punch).kind.should == "IN"
      end
    end
    context "when it is the second punch of the day" do
      before do
        punch = build(:punch)
        punch.user = @current_user
        punch.kind = Punch::IN
        punch.save
      end
      it "should prepare a new punch kind of OUT" do
        get :new
        assigns(:punch).kind.should == Punch::OUT
      end
    end
    context "when it is the third punch of the day" do
      before do
        punch = build(:punch)
        punch.user = @current_user
        punch.kind = Punch::IN
        punch.save

        another_punch = build(:punch)
        another_punch.user = @current_user
        another_punch.kind = Punch::OUT
        another_punch.save
      end
      it "should prepare a new punch kind of OUT" do
        get :new
        assigns(:punch).kind.should == Punch::IN
      end
    end
  end

  describe "GET edit" do
    it "assigns the requested punch as @punch" do
      Punch.stub(:find).with("1") { punch }
      get :edit, {:id => punch.to_param}
      assigns(:punch).should eq(punch)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "should built a new Punch with current user" do
        Punch::Register.stub(:punch).with(anything) { punch }
        punch.stub(:save) { true }
        Punch::Register.should_receive(:punch).with(@current_user, valid_attributes)
        post :create, {:punch => valid_attributes}
      end
      it "creates a new Punch" do
        expect {
          post :create, {:punch => valid_attributes}
        }.to change(Punch, :count).by(1)
      end

      it "assigns a newly created punch as @punch" do
        post :create, {:punch => valid_attributes}
        assigns(:punch).should be_a(Punch)
        assigns(:punch).should be_persisted
      end

      it "redirects to the created punch" do
        post :create, {:punch => valid_attributes}
        response.should redirect_to(Punch.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved punch as @punch" do
        Punch.any_instance.stub(:save).and_return(false)
        post :create, {:punch => {}}
        assigns(:punch).should be_a_new(Punch)
      end

      it "re-renders the 'new' template" do
        Punch.any_instance.stub(:save).and_return(false)
        post :create, {:punch => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested punch" do
        Punch.stub(:find).with("1") { punch }
        punch.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => punch.to_param, :punch => {'these' => 'params'}}
      end

      it "assigns the requested punch as @punch" do
        Punch.stub(:find).with("1") { punch }
        punch.stub(:update_attributes).with(punch.to_param) { true }
        valid_attributes = punch
        put :update, {:id => punch.to_param, :punch => valid_attributes}
        assigns(:punch).should eq(punch)
      end

      it "redirects to the punch" do
        Punch.stub(:find).with("1") { punch }
        punch.stub(:update_attributes).with(punch.to_param) { true }
        valid_attributes = punch
        put :update, {:id => punch.to_param, :punch => valid_attributes}
        response.should redirect_to(punch)
      end
    end

    describe "with invalid params" do
      it "assigns the punch as @punch" do
        Punch.stub(:find).with("1") { punch }
        punch.stub(:update_attributes) { false }
        put :update, {:id => punch.to_param, :punch => {}}
        assigns(:punch).should eq(punch)
      end

      it "re-renders the 'edit' template" do
        Punch.stub(:find).with("1") { punch }
        punch.stub(:update_attributes) { false }
        put :update, {:id => punch.to_param, :punch => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested punch" do
      punch = create(:punch)
      expect {
        delete :destroy, {:id => punch.to_param}
      }.to change(Punch, :count).by(-1)
    end

    it "redirects to the punches list" do
      Punch.stub(:find).with("1") { punch }
      delete :destroy, {:id => punch.to_param}
      response.should redirect_to(punches_url)
    end
  end

end
