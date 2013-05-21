require 'test_helper'

class TabfilesControllerTest < ActionController::TestCase
  setup do
    @tabfile = tabfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tabfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tabfile" do
    assert_difference('Tabfile.count') do
      post :create, tabfile: { file_name: @tabfile.file_name, parsed: @tabfile.parsed }
    end

    assert_redirected_to tabfile_path(assigns(:tabfile))
  end

  test "should show tabfile" do
    get :show, id: @tabfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tabfile
    assert_response :success
  end

  test "should update tabfile" do
    put :update, id: @tabfile, tabfile: { file_name: @tabfile.file_name, parsed: @tabfile.parsed }
    assert_redirected_to tabfile_path(assigns(:tabfile))
  end

  test "should destroy tabfile" do
    assert_difference('Tabfile.count', -1) do
      delete :destroy, id: @tabfile
    end

    assert_redirected_to tabfiles_path
  end
end
