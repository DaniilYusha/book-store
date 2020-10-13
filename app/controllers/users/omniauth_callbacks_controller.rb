module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end

    private

    # def authenticate_user
    #   sign_in_and_redirect @user, event: :authentication
    #   set_flash_message(:notice, :success, kind: I18n.t(:provider)) if is_navigational_format?
    # end
    #
    # def move_to_registration
    #   session['devise.facebook_data'] = request.env['omniauth.auth'].except(:extra)
    #   redirect_to new_user_registration_url
    # end
  end
end
