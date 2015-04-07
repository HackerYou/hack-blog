module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def twitter
      auth = request.env["omniauth.auth"]

      @user = User.find_by( auth.slice('provider', 'uid') )

      if @user.nil?
        @user = User.create(
          provider: auth['provider'],
          uid: auth['uid'],
          name: auth['info']['name']
        )
      end

      sign_in_and_redirect @user  # This line will sign the user in.
    end
  end
end
