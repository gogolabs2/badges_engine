require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BadgesEngine::BadgesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Badge. As you add validations to Badge, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name=>'test'}
  end
  
  def url_options(opts={})
    {:use_route => :badges}.merge(opts)
  end

  describe "GET index" do
    it "assigns all badges as @badges" do
      badge = BadgesEngine::Badge.create! valid_attributes
      get :index, url_options
      expect(assigns(:badges)).to eq([badge])
    end
  end

  describe "GET show" do
    it "assigns the requested badge as @badge" do
      badge = BadgesEngine::Badge.create! valid_attributes
      get :show, url_options(:id => badge.id.to_s)
      expect(assigns(:badge)).to eq(badge)
    end
  end

  describe "GET new" do
    it "assigns a new badge as @badge" do
      get :new, url_options
      expect(assigns(:badge)).to be_a_new(BadgesEngine::Badge)
    end
  end

  describe "GET edit" do
    it "assigns the requested badge as @badge" do
      badge = BadgesEngine::Badge.create! valid_attributes
      get :edit, url_options(:id => badge.id.to_s)
      expect(assigns(:badge)).to eq(badge)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Badge" do
        expect {
          post :create, url_options(:badge => valid_attributes)
        }.to change(BadgesEngine::Badge, :count).by(1)
      end

      it "assigns a newly created badge as @badge" do
        post :create, url_options(:badge => valid_attributes)
        expect(assigns(:badge)).to be_a(BadgesEngine::Badge)
        expect(assigns(:badge)).to be_persisted
      end

      it "redirects to the created badge" do
        post :create, url_options(:badge => valid_attributes)
        expect(response).to redirect_to(BadgesEngine::Badge.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved badge as @badge" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(BadgesEngine::Badge).to receive(:save).and_return(false)
        post :create, url_options(:badge => {})
        expect(assigns(:badge)).to be_a_new(BadgesEngine::Badge)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(BadgesEngine::Badge).to receive(:save).and_return(false)
        post :create, url_options(:badge => {})
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested badge" do
        badge = BadgesEngine::Badge.create! valid_attributes
        # Assuming there are no other badges in the database, this
        # specifies that the BadgesEngine::Badge created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(BadgesEngine::Badge).to receive(:update_attributes).with({'these' => 'params'})
        put :update, url_options(:id => badge.id, :badge => {'these' => 'params'})
      end

      it "assigns the requested badge as @badge" do
        badge = BadgesEngine::Badge.create! valid_attributes
        put :update, url_options(:id => badge.id, :badge => valid_attributes)
        expect(assigns(:badge)).to eq(badge)
      end

      it "redirects to the badge" do
        badge = BadgesEngine::Badge.create! valid_attributes
        put :update, url_options(:id => badge.id, :badge => valid_attributes)
        expect(response).to redirect_to(badge)
      end
    end

    describe "with invalid params" do
      it "assigns the badge as @badge" do
        badge = BadgesEngine::Badge.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(BadgesEngine::Badge).to receive(:save).and_return(false)
        put :update, url_options(:id => badge.id.to_s, :badge => {})
        expect(assigns(:badge)).to eq(badge)
      end

      it "re-renders the 'edit' template" do
        badge = BadgesEngine::Badge.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(BadgesEngine::Badge).to receive(:save).and_return(false)
        put :update, url_options(:id => badge.id.to_s, :badge => {})
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested badge" do
      badge = BadgesEngine::Badge.create! valid_attributes
      expect {
        delete :destroy, url_options(:id => badge.id.to_s)
      }.to change(BadgesEngine::Badge, :count).by(-1)
    end

    it "redirects to the badges list" do
      badge = BadgesEngine::Badge.create! valid_attributes
      delete :destroy, url_options(:id => badge.id.to_s)
      expect(response).to redirect_to(badges_path)
    end
  end

end
