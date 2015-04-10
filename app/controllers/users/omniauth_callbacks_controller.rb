module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def twitter
      auth = request.env["omniauth.auth"]
      @user = User.find_by_twitter(auth)
      sign_in_and_redirect @user
    end


  end
end
