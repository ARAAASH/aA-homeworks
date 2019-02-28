class AlbumsController < ApplicationController

  def index
    # /albums
    @albums = Album.all
    render json: @albums
  end

  def show
    #/albums/:id
    @album = Album.find_by(id: params[:id])
    if @album.nil?
      render json: "Couldn\'t find"
    else
      render json: @album
    end
  end

  def new
    #/bands/:band_id/albums/new
    @band = Band.find_by(band_id: params[:band_id])
    @album = Album.new
    render :new
  end

  def create
    # POST:  /albums
    @album = Album.new(album_params)
    if @album.save!
      render json: @album
    else
      render json: "not saved"
    end
  end

  def edit
    # /albums/:id/edit
    @album = find_by(id: params[:id])
    render :edit
  end

  def update
    # PATCH: /albums/:id
    @album = find_by(id: params[:id])
    if @album.update_attributes(album_params)
      render :json @album
    else
      render json: "Couldn\'t update"
    end
  end

  def destroy
    # DELETE: /albums/:id
    @album = Album.find_by(id: params[:id])
    if @album.destroy
      render json: @album
    else
      redner json: "Couldn\'t destroy"
    end
  end

  private
  def album_params
    params.require("album").permit(:title, :year, :band_id, :kind)
  end

end
