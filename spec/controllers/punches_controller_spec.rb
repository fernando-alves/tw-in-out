require 'spec_helper'

describe PunchesController, type: :controller do
  let(:punch) { create(:punch) }
  let(:workday) { create(:workday) }

  def valid_attributes
    { "time"=> "2013-01-01 09:00:00", "workday_id" => "#{workday.id}" }
  end

  before(:each) { sign_in create(:user) }

  describe "GET show" do
    it "assigns the requested punch as @punch" do
      get :show, {:id => punch.to_param}

      expect(assigns(:punch)).to eq(punch)
    end
  end

  describe "GET new" do
    it "assigns a new punch as @punch" do
      get :new

      expect(assigns(:punch)).to be_a_new(Punch)
    end
  end

  describe "GET edit" do
    it "assigns the requested punch as @punch" do
      get :edit, {:id => punch.to_param}

      expect(assigns(:punch)).to eq(punch)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Punch" do
        expect {
          post :create, {:punch => valid_attributes}
        }.to change(Punch, :count).by(1)
      end

      it "assigns a newly created punch as @punch" do
        post :create, {:punch => valid_attributes}

        expect(assigns(:punch)).to be_a Punch
        expect(assigns(:punch)).to be_persisted
      end

      it "redirects to the created punch" do
        post :create, {:punch => valid_attributes}

        expect(response).to redirect_to(Punch.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved punch as @punch" do
        allow_any_instance_of(Punch).to receive(:save) { false }

        post :create, {:punch => {}}

        expect(assigns(:punch)).to be_a_new(Punch)
      end

      it "re-renders the 'new' template" do
        allow_any_instance_of(Punch).to receive(:save) { false }

        post :create, {:punch => {}}

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested punch as @punch" do
        put :update, {:id => punch.to_param, :punch => valid_attributes}

        expect(assigns(:punch)).to eq(punch)
      end

      it "redirects to the punch" do
        put :update, {:id => punch.to_param, :punch => valid_attributes}

        expect(response).to redirect_to(punch)
      end
    end

    describe "with invalid params" do
      let(:invalid_punch) { double(id: '1', update_attributes: false) }

      it "assigns the punch as @punch" do
        allow(Punch).to receive(:find).with('1') { invalid_punch }

        put :update, {:id => '1', :punch => {}}

        expect(assigns(:punch)).to eq(invalid_punch)
      end

      it "re-renders the 'edit' template" do
        allow(Punch).to receive(:find).with('1') { invalid_punch }

        put :update, {:id => '1', :punch => {}}

        expect(response).to render_template('edit')
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
      punch = create(:punch)
      workday = punch.workday

      delete :destroy, {:id => punch.to_param}

      expect(response).to redirect_to(workday)
    end
  end

end
