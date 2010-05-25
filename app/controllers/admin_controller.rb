class AdminController < ActionController::Base
  
  def login
  end
  
  def logout
    session[:admin] = false
     flash[:notice] = "You are logged out. Bye!"
    redirect_to :controller => 'home', :action => 'index'
  end
  
  def authenticate
    if params[:password] == 'iyengar'
      flash[:notice] = "Welcome back Carl!"
      session[:admin] = true
      redirect_to :controller => 'qas', :action => 'index'
    else
      session[:admin] = false
      flash[:notice] = "Login failed"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end
