class WelcomeController < ApplicationController
  def index
  	@playlist = Playlist.new
  	return unless logged_in?
  	@playlists = Playlist.order(created_at: :desc)
  end
end
