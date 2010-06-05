class UploadController < ApplicationController
  
  before_filter :verify
  
  
  #Agile Web Development with Rails
  def get
    if verify
      @newsletter = Newsletter.new
    else
      redirect_to(:controller => 'newsletters', :action => 'index')
    end
  end
  
  def save
    if verify
      @newsletter = Newsletter.new(params[:newsletter])
      if @newsletter.save
        post = Newsletter.save_to_directory(params[:newsletter])
  #  render :text => "File has been uploaded successfully"

        flash[:notice] = "Newsletter added for " + @newsletter.str_month + " " + @newsletter.year.to_s()
        redirect_to(:action => 'get')
      else
        render(:action => :get)
      end
    else
      flash[:notice] = "login needed"
      redirect_to(:controller => 'newsletters', :action => 'index')
    end
  end
  
  def newsletter
    @newsletter = Newsletter.find(params[:id])
    send_data(@newsletter.data, :filename => @newsletter.name,
    #:type => @newsletter.content_type,
:disposition => "inline" )
  end
  
  def show
    @newsletter = Newsletter.find(params[:id])
  end
  
  private
  def verify
    session[:admin]
  end
  
end
