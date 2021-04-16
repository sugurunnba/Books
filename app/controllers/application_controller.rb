class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(current_user)
    end
  end
  
  def after_sitn_out_path_for(_resource)
    root_path
  end
  

end
