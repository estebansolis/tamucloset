class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_current_user
  protect_from_forgery with: :exception
 

  def set_current_user
    Apparel.current_user = current_user
    Student.current_user = current_user
    Rental.current_user = current_user
  end
  
  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
     redirect_to auth_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
  
  def after_sign_in_path_for(resource)
     root_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    auth_path
  end
  

end
