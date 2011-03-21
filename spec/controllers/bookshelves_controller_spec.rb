require 'spec_helper'

describe BooksController do

  def mock_book(stubs={})
    @mock_book ||= mock_model(Book, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new book as @book" do
      Book.stub(:new) { mock_book }
      get :new
      assigns(:book).should be(mock_book)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created book as @book" do
        Book.stub(:new).with({'these' => 'params'}) { mock_book(:save => true) }
        post :create, :book => {'these' => 'params'}
        assigns(:book).should be(mock_book)
      end

      it "redirects to the created book" do
        Book.stub(:new) { mock_book(:save => true) }
        post :create, :book => {}
        response.should redirect_to(book_url(mock_book))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved book as @book" do
        Book.stub(:new).with({'these' => 'params'}) { mock_book(:save => false) }
        post :create, :book => {'these' => 'params'}
        assigns(:book).should be(mock_book)
      end

      it "re-renders the 'new' template" do
        Book.stub(:new) { mock_book(:save => false) }
        post :create, :book => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested book" do
      Book.stub(:find).with("37") { mock_book }
      mock_book.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the books list" do
      Book.stub(:find) { mock_book }
      delete :destroy, :id => "1"
      response.should redirect_to(books_url)
    end
  end

end

