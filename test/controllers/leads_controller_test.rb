require 'test_helper'

class LeadsControllerTest < ActionController::TestCase
  setup do
    @lead = leads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leads)
  end

  test "should create lead" do
    assert_difference('Lead.count') do
      post :create, lead: { email: @lead.email, first_name: @lead.first_name, last_name: @lead.last_name, notes: @lead.notes, phone: @lead.phone, status: @lead.status }
    end

    assert_response 201
  end

  test "should show lead" do
    get :show, id: @lead
    assert_response :success
  end

  test "should update lead" do
    put :update, id: @lead, lead: { email: @lead.email, first_name: @lead.first_name, last_name: @lead.last_name, notes: @lead.notes, phone: @lead.phone, status: @lead.status }
    assert_response 204
  end

  test "should destroy lead" do
    assert_difference('Lead.count', -1) do
      delete :destroy, id: @lead
    end

    assert_response 204
  end
end
