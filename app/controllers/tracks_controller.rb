class TracksController < ApplicationController
  before_action :find_artist, except: [:all]
  before_action :find_album , except: [:all]
  before_action :set_track, only: [:show, :destroy]
  before_action :authenticate_user

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = @artist.tracks
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  def all
    @tracks = Track.joins(:artist).order('artists.name')
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end


  # POST /tracks
  # POST /tracks.json
  def create
    @track = @artist.tracks.new(track_params)

    respond_to do |format|
      if @track.save
        format.html {  redirect_to "/artists/#{params[:artist_id]}/tracks/#{params[:id]}", notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_artist
      @artist = Artist.find(params[:artist_id])
    end

     def find_album
      @album = Album.find(params[:album_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:name, :artist_id)
    end
end
