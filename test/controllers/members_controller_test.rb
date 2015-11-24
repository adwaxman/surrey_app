require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { active: @member.active, address_line1: @member.address_line1, address_line2: @member.address_line2, area_code: @member.area_code, city: @member.city, email: @member.email, fname: @member.fname, lname: @member.lname, local_exchange: @member.local_exchange, password: @member.password, phone_ending: @member.phone_ending, primaryEC_area_code: @member.primaryEC_area_code, primaryEC_fname: @member.primaryEC_fname, primaryEC_lname: @member.primaryEC_lname, primaryEC_local_exchange: @member.primaryEC_local_exchange, primaryEC_phone_ending: @member.primaryEC_phone_ending, primaryEC_relationship: @member.primaryEC_relationship, secondaryEC_area_code: @member.secondaryEC_area_code, secondaryEC_fname: @member.secondaryEC_fname, secondaryEC_lname: @member.secondaryEC_lname, secondaryEC_local_exchange: @member.secondaryEC_local_exchange, secondaryEC_phone_ending: @member.secondaryEC_phone_ending, secondaryEC_relationship: @member.secondaryEC_relationship, state: @member.state, tertiaryEC_area_code: @member.tertiaryEC_area_code, tertiaryEC_fname: @member.tertiaryEC_fname, tertiaryEC_lname: @member.tertiaryEC_lname, tertiaryEC_local_exchange: @member.tertiaryEC_local_exchange, tertiaryEC_phone_ending: @member.tertiaryEC_phone_ending, tertiaryEC_relationship: @member.tertiaryEC_relationship, zip: @member.zip }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    patch :update, id: @member, member: { active: @member.active, address_line1: @member.address_line1, address_line2: @member.address_line2, area_code: @member.area_code, city: @member.city, email: @member.email, fname: @member.fname, lname: @member.lname, local_exchange: @member.local_exchange, password: @member.password, phone_ending: @member.phone_ending, primaryEC_area_code: @member.primaryEC_area_code, primaryEC_fname: @member.primaryEC_fname, primaryEC_lname: @member.primaryEC_lname, primaryEC_local_exchange: @member.primaryEC_local_exchange, primaryEC_phone_ending: @member.primaryEC_phone_ending, primaryEC_relationship: @member.primaryEC_relationship, secondaryEC_area_code: @member.secondaryEC_area_code, secondaryEC_fname: @member.secondaryEC_fname, secondaryEC_lname: @member.secondaryEC_lname, secondaryEC_local_exchange: @member.secondaryEC_local_exchange, secondaryEC_phone_ending: @member.secondaryEC_phone_ending, secondaryEC_relationship: @member.secondaryEC_relationship, state: @member.state, tertiaryEC_area_code: @member.tertiaryEC_area_code, tertiaryEC_fname: @member.tertiaryEC_fname, tertiaryEC_lname: @member.tertiaryEC_lname, tertiaryEC_local_exchange: @member.tertiaryEC_local_exchange, tertiaryEC_phone_ending: @member.tertiaryEC_phone_ending, tertiaryEC_relationship: @member.tertiaryEC_relationship, zip: @member.zip }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
