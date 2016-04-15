require 'test_helper'

class JobpreferencesControllerTest < ActionController::TestCase
  setup do
    @jobpreference = jobpreferences(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobpreferences)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create jobpreference' do
    assert_difference('Jobpreference.count') do
      post :create, jobpreference: { happy_to_relocate: @jobpreference.happy_to_relocate, job_role: @jobpreference.job_role, job_title: @jobpreference.job_title, jobtitle: @jobpreference.jobtitle, location: @jobpreference.location, role_type: @jobpreference.role_type, user_id: @jobpreference.user_id }
    end

    assert_redirected_to jobpreference_path(assigns(:jobpreference))
  end

  test 'should show jobpreference' do
    get :show, id: @jobpreference
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @jobpreference
    assert_response :success
  end

  test 'should update jobpreference' do
    patch :update, id: @jobpreference, jobpreference: { happy_to_relocate: @jobpreference.happy_to_relocate, job_role: @jobpreference.job_role, job_title: @jobpreference.job_title, jobtitle: @jobpreference.jobtitle, location: @jobpreference.location, role_type: @jobpreference.role_type, user_id: @jobpreference.user_id }
    assert_redirected_to jobpreference_path(assigns(:jobpreference))
  end

  test 'should destroy jobpreference' do
    assert_difference('Jobpreference.count', -1) do
      delete :destroy, id: @jobpreference
    end

    assert_redirected_to jobpreferences_path
  end
end
