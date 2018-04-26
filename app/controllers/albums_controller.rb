class AlbumsController < ApplicationController
  before_action :find_artist, except: [:all]
  before_action :set_album, only: [:show, :destroy, :all_tracks]
  before_action :authenticate_user

  def index
    @albums = @artist.albums
  end

  def show
    @new_track = Track.new
  end

  def all
    @albums = Album.joins(:artist).order('artists.name')
  end

  def new
    @album = Album.new
  end

  def create
    @album = @artist.albums.new(album_params)

    respond_to do |format|
      if @album.save
        format.html {  redirect_to "/artists/#{params[:artist_id]}/albums/#{params[:id]}", notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def all_tracks
    @new_track = Track.new
  end

  private

    def find_artist
      @artist = Artist.find(params[:artist_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name, :artist_id, tracks_attributes: [:name])
    end
end
