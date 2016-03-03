require 'test_helper'

class RefereesControllerTest < ActionController::TestCase
  setup do
    @referee = referees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referee" do
    assert_difference('Referee.count') do
      post :create, referee: { Persons_idUser: @referee.Persons_idUser, contactPhone: @referee.contactPhone, email: @referee.email, forename: @referee.forename, howVerified: @referee.howVerified, idReferees: @referee.idReferees, permissionToContact: @referee.permissionToContact, referenceDoc: @referee.referenceDoc, relationship: @referee.relationship, surname: @referee.surname, title: @referee.title, verified: @referee.verified }
    end

    assert_redirected_to referee_path(assigns(:referee))
  end

  test "should show referee" do
    get :show, id: @referee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referee
    assert_response :success
  end

  test "should update referee" do
    patch :update, id: @referee, referee: { Persons_idUser: @referee.Persons_idUser, contactPhone: @referee.contactPhone, email: @referee.email, forename: @referee.forename, howVerified: @referee.howVerified, idReferees: @referee.idReferees, permissionToContact: @referee.permissionToContact, referenceDoc: @referee.referenceDoc, relationship: @referee.relationship, surname: @referee.surname, title: @referee.title, verified: @referee.verified }
    assert_redirected_to referee_path(assigns(:referee))
  end

  test "should destroy referee" do
    assert_difference('Referee.count', -1) do
      delete :destroy, id: @referee
    end

    assert_redirected_to referees_path
  end
end
