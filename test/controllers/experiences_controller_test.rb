require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experience" do
    assert_difference('Experience.count') do
      post :create, experience: { EmploymentLevels_idLevelsOfEmployment: @experience.EmploymentLevels_idLevelsOfEmployment, JobTitles_idJobTitles: @experience.JobTitles_idJobTitles, Persons_idUser: @experience.Persons_idUser, dateFinished: @experience.dateFinished, dateStarted: @experience.dateStarted, employerName: @experience.employerName, howVerified: @experience.howVerified, idExperiences: @experience.idExperiences, keyDuties: @experience.keyDuties, otherJobTitle: @experience.otherJobTitle, verified: @experience.verified }
    end

    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should show experience" do
    get :show, id: @experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experience
    assert_response :success
  end

  test "should update experience" do
    patch :update, id: @experience, experience: { EmploymentLevels_idLevelsOfEmployment: @experience.EmploymentLevels_idLevelsOfEmployment, JobTitles_idJobTitles: @experience.JobTitles_idJobTitles, Persons_idUser: @experience.Persons_idUser, dateFinished: @experience.dateFinished, dateStarted: @experience.dateStarted, employerName: @experience.employerName, howVerified: @experience.howVerified, idExperiences: @experience.idExperiences, keyDuties: @experience.keyDuties, otherJobTitle: @experience.otherJobTitle, verified: @experience.verified }
    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should destroy experience" do
    assert_difference('Experience.count', -1) do
      delete :destroy, id: @experience
    end

    assert_redirected_to experiences_path
  end
end
