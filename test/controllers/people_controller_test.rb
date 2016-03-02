require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { EducationalLevels_idEducatonLevel: @person.EducationalLevels_idEducatonLevel, addressLine1: @person.addressLine1, addressLine2: @person.addressLine2, authorityToWorkStatement: @person.authorityToWorkStatement, contactPreference: @person.contactPreference, dob: @person.dob, female: @person.female, fiveOrMoreGcses: @person.fiveOrMoreGcses, forename1: @person.forename1, forename2: @person.forename2, gcseMathsGrade: @person.gcseMathsGrade, gecseEnglishGrade: @person.gecseEnglishGrade, landline: @person.landline, mobile: @person.mobile, noOfAlevels: @person.noOfAlevels, noOfGcses: @person.noOfGcses, penaltyPoints: @person.penaltyPoints, personalUrl: @person.personalUrl, photo: @person.photo, postcode: @person.postcode, postcodeStart: @person.postcodeStart, secondEmail: @person.secondEmail, studentStatus: @person.studentStatus, surname: @person.surname, title: @person.title, town: @person.town, ucasPoints: @person.ucasPoints }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { EducationalLevels_idEducatonLevel: @person.EducationalLevels_idEducatonLevel, addressLine1: @person.addressLine1, addressLine2: @person.addressLine2, authorityToWorkStatement: @person.authorityToWorkStatement, contactPreference: @person.contactPreference, dob: @person.dob, female: @person.female, fiveOrMoreGcses: @person.fiveOrMoreGcses, forename1: @person.forename1, forename2: @person.forename2, gcseMathsGrade: @person.gcseMathsGrade, gecseEnglishGrade: @person.gecseEnglishGrade, landline: @person.landline, mobile: @person.mobile, noOfAlevels: @person.noOfAlevels, noOfGcses: @person.noOfGcses, penaltyPoints: @person.penaltyPoints, personalUrl: @person.personalUrl, photo: @person.photo, postcode: @person.postcode, postcodeStart: @person.postcodeStart, secondEmail: @person.secondEmail, studentStatus: @person.studentStatus, surname: @person.surname, title: @person.title, town: @person.town, ucasPoints: @person.ucasPoints }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
