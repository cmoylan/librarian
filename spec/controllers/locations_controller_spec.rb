require 'spec_helper'

describe LocationsController do

  def mock_location(stubs={})
    @mock_location ||= mock_model(Location, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new location as @location" do
      Location.stub(:new) { mock_location }
      get :new
      assigns(:location).should be(mock_location)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created location as @location" do
        Location.stub(:new).with({'these' => 'params'}) { mock_location(:save => true) }
        post :create, :location => {'these' => 'params'}
        assigns(:location).should be(mock_location)
      end

      it "redirects to the location list" do
        Location.stub(:new) { mock_location(:save => true) }
        post :create, :location => {}
        response.should redirect_to(locations_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved location as @location" do
        Location.stub(:new).with({'these' => 'params'}) { mock_location(:save => false) }
        post :create, :location => {'these' => 'params'}
        assigns(:location).should be(mock_location)
      end

      it "re-renders the 'new' template" do
        Location.stub(:new) { mock_location(:save => false) }
        post :create, :location => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested location" do
      Location.stub(:find).with("37") { mock_location }
      mock_location.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the locations list" do
      Location.stub(:find) { mock_location }
      delete :destroy, :id => "1"
      response.should redirect_to(locations_url)
    end
  end

end

