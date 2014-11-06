class ApplicationController < ActionController::Base
 before_filter :enable_tenant
 
  #include Concerns::Url
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_out_path_for(resource)
   home_path
  end


  def enable_tenant
    @tenant = Tenant.new(current_user)
  end

end
