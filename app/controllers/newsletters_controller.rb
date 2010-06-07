class NewslettersController < ApplicationController
  # GET /newsletters
  # GET /newsletters.xml
  def index
    @newsletters = Newsletter.find(:all, :order => "year DESC, month DESC")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletters }
    end
  end
  
  # GET /newsletters/1
  # GET /newsletters/1.xml
  def show
    @newsletter = Newsletter.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletter }
    end
  end
  
  def display
    @newsletter = Newsletter.find(params[:id])
     send_data(@newsletter.data, :type => 'application/pdf', :disposition => 'attachment', :filename => @newsletter.name )
  end
  
  # GET /newsletters/new
  # GET /newsletters/new.xml
  def new
    @newsletter = Newsletter.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletter }
    end
  end
  
  # GET /newsletters/1/edit
  def edit
    @newsletter = Newsletter.find(params[:id])
  end
  
 
  # POST /newsletters
  # POST /newsletters.xml
  def create
    @newsletter = Newsletter.new(params[:newsletter])
    respond_to do |format|
      if @newsletter.save
        flash[:notice] = @newsletter.str_month + ' ' + @newsletter.year.to_s() + ' newsletter was successfully created.'
        format.html { redirect_to(newsletters_url) }
        format.xml  { render :xml => @newsletter, :status => :created, :location => @newsletter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /newsletters/1
  # PUT /newsletters/1.xml
  def update
    @newsletter = Newsletter.find(params[:id])
    
    respond_to do |format|
      if @newsletter.update_attributes(params[:newsletter])
        flash[:notice] = @newsletter.str_month + ' ' + @newsletter.year.to_s() + ' newsletter was successfully updated.'
        format.html { redirect_to(newsletters_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /newsletters/1
  # DELETE /newsletters/1.xml
  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    
    respond_to do |format|
      format.html { redirect_to(newsletters_url) }
      format.xml  { head :ok }
    end
  end
end
