class NotificationsController < ApplicationController
  before_filter :set_menu_tab
  
  def index
  end
  
  def create
    if Notifier.deliver_contact(params[:contact])
      flash[:notice] = "Email was successfully sent."
      redirect_to :controller => 'home', :action => 'contact'
    else
      flash.now[:error] = "An error occurred while sending this email."
      render :index
    end
  end 
  
  
  def createold
    Notifier.deliver_gmail_message
    flash[:notice] = "your message has been sent"
    
    
    # redirect_to root_path
    redirect_to :controller => 'home', :action => 'contact'
    
    
  end
  
  def set_menu_tab
    @selected_tab = 'contact'
  end
  
end
