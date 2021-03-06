require 'test_helper'

module Api
  module V1
    class CustomersControllerTest < ActionController::TestCase
      tests ::Api::V1::CustomersController

      fixtures :all

      let(:data) { users :data }
      let(:customer) { customers :starfleet }

      describe "unauthorized" do
        it "Unauthrized user cant view customers index" do
          get :index

          assert_response :forbidden
          json = JSON.parse response.body
          assert_equal "authentication.missing", json["code"]
        end

        it "Unauthrized user cant view customer" do
          get :show, id: customer.id

          assert_response :forbidden
        end

        it "Unauthrized user cant create new customer" do
          post :create, customer: { name: "foo" }

          assert_response :forbidden
        end

        it "Unauthrized user cant destroy customer" do
          delete :destroy, id: customer.id

          assert_response :forbidden

          assert_equal customer, Customer.where(id: customer.id).first
        end
      end

      describe "happy path" do
        before do
          add_authorization data
        end

        it "renders a customer list" do
          get :index

          assert_response :ok
        end

        it "renders a customer" do
          get :show, id: customer.id

          assert_response :ok

          json = JSON.parse response.body
          assert_equal customer.id, json["uuid"]
          assert_equal customer.name, json["name"]
        end

        it "creates a new customer" do
          post :create, name: "foo"

          assert_response :created

          json = JSON.parse response.body
          assert json["uuid"]
          assert_equal "foo", json["name"]
        end

        it "User can destroy customer" do
          klingon = customers :klingon
          delete :destroy, id: klingon.id

          assert_response :ok

          refute_equal klingon, Customer.where(id: klingon.id).first
        end
      end
    end
  end
end
