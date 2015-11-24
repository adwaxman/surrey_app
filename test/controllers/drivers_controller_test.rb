require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post :create, driver: { accommodate_aide: @driver.accommodate_aide, accommodate_wheelchair: @driver.accommodate_wheelchair, address_line1: @driver.address_line1, address_line2: @driver.address_line2, area_code: @driver.area_code, car_type: @driver.car_type, city: @driver.city, email: @driver.email, fname: @driver.fname, friday: @driver.friday, friday_max: @driver.friday_max, friday_min: @driver.friday_min, lname: @driver.lname, local_exchange: @driver.local_exchange, monday: @driver.monday, monday_max: @driver.monday_max, monday_min: @driver.monday_min, password: @driver.password, phone_ending: @driver.phone_ending, preferred_contact: @driver.preferred_contact, state: @driver.state, thursday: @driver.thursday, thursday_max: @driver.thursday_max, thursday_min: @driver.thursday_min, tuesday: @driver.tuesday, tuesday_max: @driver.tuesday_max, tuesday_min: @driver.tuesday_min, unavailable: @driver.unavailable, wednesday: @driver.wednesday, wednesday_max: @driver.wednesday_max, wednesday_min: @driver.wednesday_min, zip: @driver.zip }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should show driver" do
    get :show, id: @driver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver
    assert_response :success
  end

  test "should update driver" do
    patch :update, id: @driver, driver: { accommodate_aide: @driver.accommodate_aide, accommodate_wheelchair: @driver.accommodate_wheelchair, address_line1: @driver.address_line1, address_line2: @driver.address_line2, area_code: @driver.area_code, car_type: @driver.car_type, city: @driver.city, email: @driver.email, fname: @driver.fname, friday: @driver.friday, friday_max: @driver.friday_max, friday_min: @driver.friday_min, lname: @driver.lname, local_exchange: @driver.local_exchange, monday: @driver.monday, monday_max: @driver.monday_max, monday_min: @driver.monday_min, password: @driver.password, phone_ending: @driver.phone_ending, preferred_contact: @driver.preferred_contact, state: @driver.state, thursday: @driver.thursday, thursday_max: @driver.thursday_max, thursday_min: @driver.thursday_min, tuesday: @driver.tuesday, tuesday_max: @driver.tuesday_max, tuesday_min: @driver.tuesday_min, unavailable: @driver.unavailable, wednesday: @driver.wednesday, wednesday_max: @driver.wednesday_max, wednesday_min: @driver.wednesday_min, zip: @driver.zip }
    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete :destroy, id: @driver
    end

    assert_redirected_to drivers_path
  end
end
