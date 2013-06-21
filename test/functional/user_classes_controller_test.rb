require 'test_helper'

class UserClassesControllerTest < ActionController::TestCase
  setup do
    @user_class = user_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_class" do
    assert_difference('UserClass.count') do
      post :create, user_class: { classdesc: @user_class.classdesc, classname: @user_class.classname }
    end

    assert_redirected_to user_class_path(assigns(:user_class))
  end

  test "should show user_class" do
    get :show, id: @user_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_class
    assert_response :success
  end

  test "should update user_class" do
    put :update, id: @user_class, user_class: { classdesc: @user_class.classdesc, classname: @user_class.classname }
    assert_redirected_to user_class_path(assigns(:user_class))
  end

  test "should destroy user_class" do
    assert_difference('UserClass.count', -1) do
      delete :destroy, id: @user_class
    end

    assert_redirected_to user_classes_path
  end
end
