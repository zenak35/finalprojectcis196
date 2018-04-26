class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
    redirect_to root_path unless @playlist.user == current_user
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = current_user.playlist.new(playlist_params)

    if @playlist.save
      redirect_to @playlist.user
    else
      render :new
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    if @playlist.user == current_user && @playlist.update(playlist_params)
      redirect_to @playlist.user
    else
      render :edit
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
     @playlist.destroy if @playlist.user == current_user
    redirect_back(fallback_location: @playlist.user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:user_id, :name)
    end
end
