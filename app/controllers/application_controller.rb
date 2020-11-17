class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e
    redirect_to root_path
  end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :first_name,
      :family_name,
      :first_name_kana,
      :family_name_kana,
      :birth_date,
      :post_code,
      :prefecture_code,
      :city,
      :house_number,
      :building_name,
      :phone_number
    ])
  end
end
