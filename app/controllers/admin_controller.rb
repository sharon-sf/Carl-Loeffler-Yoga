class AdminController < ActionController::Base
  
  def login
  end
  
  def authenticate
    if params[:password] == 'iyengar'
      flash[:notice] = "Welcome back Carl!"
      session[:admin] = true
      redirect_to :controller => 'qas', :action => 'index'
    else
      session[:admin] = false
    end
  end
end
