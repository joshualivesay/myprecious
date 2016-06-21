require 'test_helper'

class SchedulersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduler = schedulers(:one)
  end

  test "should get index" do
    get schedulers_url
    assert_response :success
  end

  test "should create scheduler" do
    assert_difference('Scheduler.count') do
      post schedulers_url, params: { scheduler: { active: @scheduler.active, location: @scheduler.location } }
    end

    assert_response 201
  end

  test "should show scheduler" do
    get scheduler_url(@scheduler)
    assert_response :success
  end

  test "should update scheduler" do
    patch scheduler_url(@scheduler), params: { scheduler: { active: @scheduler.active, location: @scheduler.location } }
    assert_response 200
  end

  test "should destroy scheduler" do
    assert_difference('Scheduler.count', -1) do
      delete scheduler_url(@scheduler)
    end

    assert_response 204
  end
end
