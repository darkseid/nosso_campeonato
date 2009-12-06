class PhasesController < ApplicationController
  # GET /phases
  # GET /phases.xml
  def index
    @phases = Phase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phases }
    end
  end

  # GET /phases/1
  # GET /phases/1.xml
  def show
    @phase = Phase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phase }
    end
  end

  # GET /phases/new
  # GET /phases/new.xml
  def new
    @phase = Phase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phase }
    end
  end

  # GET /phases/1/edit
  def edit
    @phase = Phase.find(params[:id])
  end

  # POST /phases
  # POST /phases.xml
  def create
    @phase = Phase.new(params[:phase])

    respond_to do |format|
      if @phase.save
        flash[:notice] = 'Phase was successfully created.'
        format.html { redirect_to(@phase) }
        format.xml  { render :xml => @phase, :status => :created, :location => @phase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phases/1
  # PUT /phases/1.xml
  def update
    @phase = Phase.find(params[:id])

    respond_to do |format|
      if @phase.update_attributes(params[:phase])
        flash[:notice] = 'Phase was successfully updated.'
        format.html { redirect_to(@phase) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.xml
  def destroy
    @phase = Phase.find(params[:id])
    @phase.destroy

    respond_to do |format|
      format.html { redirect_to(phases_url) }
      format.xml  { head :ok }
    end
  end
  
end
