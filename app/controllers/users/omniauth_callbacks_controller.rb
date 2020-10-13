module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      @user.persisted? ? authenticate_user : move_to_registration
    end

    def failure
      redirect_to root_path
    end
  end
end
