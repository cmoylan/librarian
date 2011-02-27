require 'test_helper'

class BookshelvesControllerTest < ActionController::TestCase
  setup do
    @bookshelf = bookshelves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookshelves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookshelf" do
    assert_difference('Bookshelf.count') do
      post :create, :bookshelf => @bookshelf.attributes
    end

    assert_redirected_to bookshelf_path(assigns(:bookshelf))
  end

  test "should show bookshelf" do
    get :show, :id => @bookshelf.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bookshelf.to_param
    assert_response :success
  end

  test "should update bookshelf" do
    put :update, :id => @bookshelf.to_param, :bookshelf => @bookshelf.attributes
    assert_redirected_to bookshelf_path(assigns(:bookshelf))
  end

  test "should destroy bookshelf" do
    assert_difference('Bookshelf.count', -1) do
      delete :destroy, :id => @bookshelf.to_param
    end

    assert_redirected_to bookshelves_path
  end
end
