class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks
  accepts_nested_attributes_for :tracks, reject_if: :all_blank
  validates :name, presence: true
  validates_uniqueness_of :name, scope: [:artist_id]
  validate :album_in_db

  def album_search
  	RSpotify::Album.search("#{artist.name} #{name}")
  end

  def all_tracks
  	albums = album_search
    return if albums.empty?
    albums.first.tracks.map(&:name).map do |str|
      last_index = str.index('(') || str.size
      str.slice(0..(last_index - 1)).strip
    end
  end

   def spotify_uri
    albums = album_search
    return if albums.empty?
    albums.first.uri
   end

  private

  def album_in_db
    artist_invalid = artist && artist.name && artist.name.present?
    album_invalid = name.present? && album_search.empty?
    errors.add(:base, 'Must be a valid album for the artist in Spotify') if artist_invalid && album_invalid
  end
end
