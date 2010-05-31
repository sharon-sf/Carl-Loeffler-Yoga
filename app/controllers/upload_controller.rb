class UploadController < ApplicationController
  
  #Agile Web Development with Rails
  def get
    @newsletter = Newsletter.new
  end
  
  def save
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
       flash[:notice] = "Newsletter added for " + @newsletter.str_month + " " + @newsletter.year.to_s()
      redirect_to (:action => 'get')
    else
      render(:action => :get)
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
  
end
