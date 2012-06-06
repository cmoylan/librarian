class LocationsController < ApplicationController
  # GET /locations
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])
    @bookshelves = Bookshelf.all
    @available_bookshelves = Bookshelf.available

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  def create
    @location = Location.new(params[:location])

    if @location.save
      redirect_to locations_path, :notice => 'Location was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /locations/1
  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(params[:location])
      redirect_to locations_path, :notice => 'Location was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /locations/1
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_url
  end
end
