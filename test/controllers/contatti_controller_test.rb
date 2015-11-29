require 'test_helper'

class ContattiControllerTest < ActionController::TestCase
  setup do
    @contatto = contatti(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contatti)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contatto" do
    assert_difference('Contatto.count') do
      post :create, contatto: {  }
    end

    assert_redirected_to contatto_path(assigns(:contatto))
  end

  test "should show contatto" do
    get :show, id: @contatto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contatto
    assert_response :success
  end

  test "should update contatto" do
    patch :update, id: @contatto, contatto: {  }
    assert_redirected_to contatto_path(assigns(:contatto))
  end

  test "should destroy contatto" do
    assert_difference('Contatto.count', -1) do
      delete :destroy, id: @contatto
    end

    assert_redirected_to contatti_path
  end
end
