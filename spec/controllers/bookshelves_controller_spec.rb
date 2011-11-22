require 'spec_helper'

describe BookshelvesController do

  def mock_bookshelf(stubs={})
    @mock_bookshelf ||= mock_model(Bookshelf, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new bookshelf as @bookshelf" do
      Bookshelf.stub(:new) { mock_bookshelf }
      get :new
      assigns(:bookshelf).should be(mock_bookshelf)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created bookshelf as @bookshelf" do
        Bookshelf.stub(:new).with({'these' => 'params'}) { mock_bookshelf(:save => true) }
        post :create, :bookshelf => {'these' => 'params'}
        assigns(:bookshelf).should be(mock_bookshelf)
      end

      it "redirects to the created bookshelf" do
        Bookshelf.stub(:new) { mock_bookshelf(:save => true) }
        post :create, :bookshelf => {}
        response.should redirect_to(bookshelf_url(mock_bookshelf))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bookshelf as @bookshelf" do
        Bookshelf.stub(:new).with({'these' => 'params'}) { mock_bookshelf(:save => false) }
        post :create, :bookshelf => {'these' => 'params'}
        assigns(:bookshelf).should be(mock_bookshelf)
      end

      it "re-renders the 'new' template" do
        Bookshelf.stub(:new) { mock_bookshelf(:save => false) }
        post :create, :bookshelf => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bookshelf" do
      Bookshelf.stub(:find).with("37") { mock_bookshelf }
      mock_bookshelf.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bookshelves list" do
      Bookshelf.stub(:find) { mock_bookshelf }
      delete :destroy, :id => "1"
      response.should redirect_to(bookshelves_url)
    end
  end

  describe "POST update_positions" do
    before :all do
      Bookshelf.destroy_all

      @json = %[{
        "1":{
          "x1":170,
          "y1":122,
          "x2":374,
          "y2":326
        },
        "2":{
          "x1":164,
          "y1":50,
          "x2":308,
          "y2":108
        }
      }]

      @parsed_json = {
        "1" => {
          :x1 => 170,
          :y1 => 122,
          :x2 => 374,
          :y2 => 326
        },
        "2" => {
          :x1 => 164,
          :y1 => 50,
          :x2 => 308,
          :y2 => 108
        }
      }

      @bookshelf1 = Factory(:bookshelf, :id => 1, :x1 => 666)
      @bookshelf2 = Factory(:bookshelf, :id => 2, :y2 => 23)
    end

    it "should update each bookshelf's positions" do
      ActiveSupport::JSON.should_receive(:decode)
        .with(@json)
        .and_return(@parsed_json)

      Bookshelf.should_receive(:find).with("1").and_return(@bookshelf1)
      Bookshelf.should_receive(:find).with("2").and_return(@bookshelf2)

      post :update_positions, :positions => @json

      @bookshelf1.x1.should == 170
      @bookshelf2.y2.should == 108
    end
  end
end

