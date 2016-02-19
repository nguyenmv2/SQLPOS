require 'test_helper'

class ModifiersControllerTest < ActionController::TestCase
  setup do
    @modifier = modifiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modifiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modifier" do
    assert_difference('Modifier.count') do
      post :create, modifier: { deltaPrice: @modifier.deltaPrice, name: @modifier.name }
    end

    assert_redirected_to modifier_path(assigns(:modifier))
  end

  test "should show modifier" do
    get :show, id: @modifier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modifier
    assert_response :success
  end

  test "should update modifier" do
    patch :update, id: @modifier, modifier: { deltaPrice: @modifier.deltaPrice, name: @modifier.name }
    assert_redirected_to modifier_path(assigns(:modifier))
  end

  test "should destroy modifier" do
    assert_difference('Modifier.count', -1) do
      delete :destroy, id: @modifier
    end

    assert_redirected_to modifiers_path
  end
end
