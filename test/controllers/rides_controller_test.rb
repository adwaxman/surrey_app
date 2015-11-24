require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  setup do
    @ride = rides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post :create, ride: { aide: @ride.aide, client_id: @ride.client_id, completion_notes: @ride.completion_notes, destination_id: @ride.destination_id, driver_id: @ride.driver_id, hearing_impaired: @ride.hearing_impaired, origin_id: @ride.origin_id, recurring: @ride.recurring, request_checked: @ride.request_checked, requested_driver: @ride.requested_driver, status: @ride.status, vision_impaired: @ride.vision_impaired, wheelchair: @ride.wheelchair }
    end

    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should show ride" do
    get :show, id: @ride
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride
    assert_response :success
  end

  test "should update ride" do
    patch :update, id: @ride, ride: { aide: @ride.aide, client_id: @ride.client_id, completion_notes: @ride.completion_notes, destination_id: @ride.destination_id, driver_id: @ride.driver_id, hearing_impaired: @ride.hearing_impaired, origin_id: @ride.origin_id, recurring: @ride.recurring, request_checked: @ride.request_checked, requested_driver: @ride.requested_driver, status: @ride.status, vision_impaired: @ride.vision_impaired, wheelchair: @ride.wheelchair }
    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete :destroy, id: @ride
    end

    assert_redirected_to rides_path
  end
end
