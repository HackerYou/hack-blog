require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "twitter returns a user if one exists" do

  end

  test "twitter creates a user if one doesn't exist" do
    request.env["omniauth.auth"] = {
      'provider' => 'twitter',
      'uid' => '1234',
      'info' => { 'name' => 'Ryan' }
    }
    request.env["devise.mapping"] = Devise.mappings[:user]
    post :twitter

    user = User.last

    assert_equal(user.uid, '1234')
    assert_equal(user.name, 'Ryan')
  end
end
