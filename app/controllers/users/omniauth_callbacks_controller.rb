class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all

    user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    # binding.pry
    if user.persisted?
      flash[:notice] = "You are in..!!! Successfully Signed In"
      sign_in_and_redirect(user)
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
      redirect_to root_path
  end


  alias_method :facebook, :all
  alias_method :twitter, :all  
  alias_method :google_oauth2, :all
end