class QasController < ApplicationController
  before_filter :set_menu_tab
  # GET /qas
  # GET /qas.xml
  def index
    @qas = session[:admin] ? Qa.find(:all, :order => "created_at DESC") : Qa.find(:all, :conditions => "answer != ''",:order => "created_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qas }
    end
  end

  # GET /qas/1
  # GET /qas/1.xml
  def show
    @qa = Qa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qa }
    end
  end

  # GET /qas/new
  # GET /qas/new.xml
  def new
    @qa = Qa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qa }
    end
  end

  # GET /qas/1/edit
  def edit
    @qa = Qa.find(params[:id])
  end

  # POST /qas
  # POST /qas.xml
  def create
    @qa = Qa.new(params[:qa])

    respond_to do |format|
      if @qa.save
        flash[:notice] = 'Thanks for submitting your question. Check the archives later for Carl\'s answer!'
        format.html { redirect_to :controller => 'qas', :action => 'index' }
        format.xml  { render :xml => @qa, :status => :created, :location => @qa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qas/1
  # PUT /qas/1.xml
  def update
    @qa = Qa.find(params[:id])

    respond_to do |format|
      if @qa.update_attributes(params[:qa])
        flash[:notice] = 'Qa was successfully updated.'
        format.html { redirect_to(@qa) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qas/1
  # DELETE /qas/1.xml
  def destroy
    @qa = Qa.find(params[:id])
    @qa.destroy

    respond_to do |format|
      format.html { redirect_to(qas_url) }
      format.xml  { head :ok }
    end
  end
  
  def set_menu_tab
    @selected_tab = params[:action] == 'new' ? 'qas' : 'archives'
  end
end
