require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address2: @user.address2, address3: @user.address3, address4: @user.address4, address5: @user.address5, address6: @user.address6, address: @user.address, admin: @user.admin, birthday: @user.birthday, class_id: @user.class_id, email: @user.email, passwd: @user.passwd, phonenum: @user.phonenum, regtime: @user.regtime, username: @user.username }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { address2: @user.address2, address3: @user.address3, address4: @user.address4, address5: @user.address5, address6: @user.address6, address: @user.address, admin: @user.admin, birthday: @user.birthday, class_id: @user.class_id, email: @user.email, passwd: @user.passwd, phonenum: @user.phonenum, regtime: @user.regtime, username: @user.username }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
