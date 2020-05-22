class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # class Forbidden < ActionController::ActionControllerError
  # end

  # rescue_from Forbidden, with: :rescue403



  private
  
  # def rescue403(e)
  #   @exception = e
  #   render template: 'errors/forbidden', status: 403
  # end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :name_kana, :birthdate, :phone])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end
