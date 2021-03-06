class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                                            :store_id, :brand_id, :unit_id, :item_category_id) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :password, :password_confirmation,
                                                                   :store_id, :brand_id, :unit_id, :current_password, 
                                                                   :item_category_id, :admin, :approved) }
  end
  
end