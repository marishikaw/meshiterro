class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  # devise利用の機能が使われる場合、その前にconfigure_permitted_parametersアクションを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  protected
  
  def configure_permitted_parameters
    # ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
