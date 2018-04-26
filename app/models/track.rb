class Track < ApplicationRecord
  belongs_to :artist
  validates :name, presence: true
  validates_uniqueness_of :name, scope: [:artist_id]
  validate :track_in_db

  def track_search
    RSpotify::Track.search("#{artist.name} #{name}")
  end

  def spotify_uri
    tracks = track_search
    return if tracks.empty?
    tracks.first.uri
  end

  private

  def track_in_db
    artist_invalid = artist && artist.name && artist.name.present?
    track_invalid = name.present? && track_search.empty?
    errors.add(:base, 'Must be a valid track for the artist in Spotify') if artist_invalid && track_invalid
  end
end
