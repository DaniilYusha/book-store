module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      @user.persisted? ? authenticate_user : move_to_registration
    end

    def failure
      redirect_to root_path
    end

    private

    def authenticate_user
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: I18n.t(:provider)) if is_navigational_format?
    end

    def move_to_registration
      session['devise.facebook_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url
    end
  end
end
