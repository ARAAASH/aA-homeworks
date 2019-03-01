class TracksController < ApplicationController

  before_action :logged_in_user!

  def show
    # /tracks/:id
    @track = Track.find_by(id: params[:id])
    if @track.nil?
      render json: "Couldn\'t find"
    else
      render :show
    end
  end

  def new
    # /albums/:album_id/tracks/new
    @track = Track.new
    @album = Album.find_by(id: params[:album_id])
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save!
      redirect_to track_url(@track)
    else
      render json: "Couldn\'t save"
    end
  end

  def edit
    # /tracks/:id/edit
    @track = Track.find_by(id: params[:id])
    @albums = Album.all
    if @track.nil?
      render json: "Couldn\'t find"
    else
      render :edit
    end
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render json: "Couldn\'t update"
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track.destroy
      redirect_to album_url(@track.album)
    else
      redner json: "Couldn\'t destroy"
    end
  end

  private
  def track_params
    params.require("track").permit(:album_id, :title, :ord, :lyrics, :type_track)
  end
end
