class HomeController < ApplicationController
  
  before_filter :set_menu_tab
  
  def about
  end
  
  def philosophy
  end
  
  def bio
  end
  
  def contact
  end
  
  def set_menu_tab
    @selected_tab = params[:action]
  end
end
