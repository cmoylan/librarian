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

end

