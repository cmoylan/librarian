class BookshelvesController < ApplicationController
  # GET /bookshelves
  # GET /bookshelves.xml
  def index
    @bookshelves = Bookshelf.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookshelves }
    end
  end

  # GET /bookshelves/1
  # GET /bookshelves/1.xml
  def show
    @bookshelf = Bookshelf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookshelf }
    end
  end

  # GET /bookshelves/new
  # GET /bookshelves/new.xml
  def new
    @bookshelf = Bookshelf.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookshelf }
    end
  end

  # GET /bookshelves/1/edit
  def edit
    @bookshelf = Bookshelf.find(params[:id])
  end

  # POST /bookshelves
  # POST /bookshelves.xml
  def create
    @bookshelf = Bookshelf.new(params[:bookshelf])

    respond_to do |format|
      if @bookshelf.save
        format.html { redirect_to(@bookshelf, :notice => 'Bookshelf was successfully created.') }
        format.xml  { render :xml => @bookshelf, :status => :created, :location => @bookshelf }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookshelf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookshelves/1
  # PUT /bookshelves/1.xml
  def update
    @bookshelf = Bookshelf.find(params[:id])

    respond_to do |format|
      if @bookshelf.update_attributes(params[:bookshelf])
        format.html { redirect_to(@bookshelf, :notice => 'Bookshelf was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookshelf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookshelves/1
  # DELETE /bookshelves/1.xml
  def destroy
    @bookshelf = Bookshelf.find(params[:id])
    @bookshelf.destroy

    respond_to do |format|
      format.html { redirect_to(bookshelves_url) }
      format.xml  { head :ok }
    end
  end

  # POST /locations/:id/assign
  def assign
    @bookshelf = Bookshelf.find(params[:available_bookshelf_id])
    location = Location.find(params[:location_id])

    @bookshelf.location = location

    respond_to do |format|
      if @bookshelf.save
        format.html { redirect_to(location, :notice => "Bookshelf added") }
        format.xml  { head :ok }
      else
        format.html {'fail'}
        format.xml  { render :xml => @bookshelf.errors, :status => :unprocessable_entity }
      end
    end
  end

  def unassign
    location = Location.find(params[:location_id])
    @bookshelf = Bookshelf.find(params[:bookshelf_id])
    @bookshelf.location = nil

    respond_to do |format|
      if @bookshelf.save
        format.html { redirect_to(location, :notice => "Bookshelf removed") }
        format.xml  { head :ok }
      else
        format.html {'fail'}
        format.xml  { render :xml => @bookshelf.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_positions
    # TODO: return something
    positions = ActiveSupport::JSON.decode(params[:positions])

    positions.keys.each do |key|
      bookshelf = Bookshelf.find(key)
      bookshelf.update_attributes(positions[key])
      bookshelf.save
    end

    render :text => 'done'
  end
end
