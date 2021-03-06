require 'rails_helper'

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

RSpec.describe HeadingsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Heading. As you add validations to Heading, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HeadingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all headings as @headings" do
      heading = Heading.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:headings)).to eq([heading])
    end
  end

  describe "GET #show" do
    it "assigns the requested heading as @heading" do
      heading = Heading.create! valid_attributes
      get :show, {:id => heading.to_param}, valid_session
      expect(assigns(:heading)).to eq(heading)
    end
  end

  describe "GET #new" do
    it "assigns a new heading as @heading" do
      get :new, {}, valid_session
      expect(assigns(:heading)).to be_a_new(Heading)
    end
  end

  describe "GET #edit" do
    it "assigns the requested heading as @heading" do
      heading = Heading.create! valid_attributes
      get :edit, {:id => heading.to_param}, valid_session
      expect(assigns(:heading)).to eq(heading)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Heading" do
        expect {
          post :create, {:heading => valid_attributes}, valid_session
        }.to change(Heading, :count).by(1)
      end

      it "assigns a newly created heading as @heading" do
        post :create, {:heading => valid_attributes}, valid_session
        expect(assigns(:heading)).to be_a(Heading)
        expect(assigns(:heading)).to be_persisted
      end

      it "redirects to the created heading" do
        post :create, {:heading => valid_attributes}, valid_session
        expect(response).to redirect_to(Heading.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved heading as @heading" do
        post :create, {:heading => invalid_attributes}, valid_session
        expect(assigns(:heading)).to be_a_new(Heading)
      end

      it "re-renders the 'new' template" do
        post :create, {:heading => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested heading" do
        heading = Heading.create! valid_attributes
        put :update, {:id => heading.to_param, :heading => new_attributes}, valid_session
        heading.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested heading as @heading" do
        heading = Heading.create! valid_attributes
        put :update, {:id => heading.to_param, :heading => valid_attributes}, valid_session
        expect(assigns(:heading)).to eq(heading)
      end

      it "redirects to the heading" do
        heading = Heading.create! valid_attributes
        put :update, {:id => heading.to_param, :heading => valid_attributes}, valid_session
        expect(response).to redirect_to(heading)
      end
    end

    context "with invalid params" do
      it "assigns the heading as @heading" do
        heading = Heading.create! valid_attributes
        put :update, {:id => heading.to_param, :heading => invalid_attributes}, valid_session
        expect(assigns(:heading)).to eq(heading)
      end

      it "re-renders the 'edit' template" do
        heading = Heading.create! valid_attributes
        put :update, {:id => heading.to_param, :heading => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested heading" do
      heading = Heading.create! valid_attributes
      expect {
        delete :destroy, {:id => heading.to_param}, valid_session
      }.to change(Heading, :count).by(-1)
    end

    it "redirects to the headings list" do
      heading = Heading.create! valid_attributes
      delete :destroy, {:id => heading.to_param}, valid_session
      expect(response).to redirect_to(headings_url)
    end
  end

end
