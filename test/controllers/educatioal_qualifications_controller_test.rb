require 'test_helper'

class EducatioalQualificationsControllerTest < ActionController::TestCase
  setup do
    @educatioal_qualification = educatioal_qualifications(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:educatioal_qualifications)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create educatioal_qualification' do
    assert_difference('EducatioalQualification.count') do
      post :create, educatioal_qualification: { EducationalLevels_idEducationLevel: @educatioal_qualification.EducationalLevels_idEducationLevel, Persons_idUser: @educatioal_qualification.Persons_idUser, country: @educatioal_qualification.country, courseName: @educatioal_qualification.courseName, howVerified: @educatioal_qualification.howVerified, idEducationalQualification: @educatioal_qualification.idEducationalQualification, mainSubject: @educatioal_qualification.mainSubject, nameOfInstitutions: @educatioal_qualification.nameOfInstitutions, qualificationType: @educatioal_qualification.qualificationType, result: @educatioal_qualification.result, thesesTitle: @educatioal_qualification.thesesTitle, verified: @educatioal_qualification.verified, vocational: @educatioal_qualification.vocational, yearObtained: @educatioal_qualification.yearObtained }
    end

    assert_redirected_to educatioal_qualification_path(assigns(:educatioal_qualification))
  end

  test 'should show educatioal_qualification' do
    get :show, id: @educatioal_qualification
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @educatioal_qualification
    assert_response :success
  end

  test 'should update educatioal_qualification' do
    patch :update, id: @educatioal_qualification, educatioal_qualification: { EducationalLevels_idEducationLevel: @educatioal_qualification.EducationalLevels_idEducationLevel, Persons_idUser: @educatioal_qualification.Persons_idUser, country: @educatioal_qualification.country, courseName: @educatioal_qualification.courseName, howVerified: @educatioal_qualification.howVerified, idEducationalQualification: @educatioal_qualification.idEducationalQualification, mainSubject: @educatioal_qualification.mainSubject, nameOfInstitutions: @educatioal_qualification.nameOfInstitutions, qualificationType: @educatioal_qualification.qualificationType, result: @educatioal_qualification.result, thesesTitle: @educatioal_qualification.thesesTitle, verified: @educatioal_qualification.verified, vocational: @educatioal_qualification.vocational, yearObtained: @educatioal_qualification.yearObtained }
    assert_redirected_to educatioal_qualification_path(assigns(:educatioal_qualification))
  end

  test 'should destroy educatioal_qualification' do
    assert_difference('EducatioalQualification.count', -1) do
      delete :destroy, id: @educatioal_qualification
    end

    assert_redirected_to educatioal_qualifications_path
  end
end
