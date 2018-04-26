class Artist < ApplicationRecord
  has_many :tracks, dependent: :destroy
  has_many :albums, dependent: :destroy
  accepts_nested_attributes_for :tracks, reject_if: :all_blank
  accepts_nested_attributes_for :albums, reject_if: :all_blank
  validates :name, presence: true, uniqueness: true
  validate :artist_in_db

  def artist_search
    RSpotify::Artist.search(name)
  end

  def related_artists
    artists = artist_search
    return if artists.empty?
    artists.first.related_artists.map(&:name)
  end

  def top_tracks
    artists = artist_search
    return if artists.empty?
    artists.first.top_tracks(:US).map(&:name).map do |str|
      last_index = str.index('(') || str.size
      str.slice(0..(last_index - 1)).strip
    end
  end

  def all_albums
  	artists = artist_search
  	return if artists.empty?
  	artists.first.albums.map(&:name)
  end

  private

  def artist_in_db
    errors.add(:base, 'Must be a valid artist in Spotify') if name && name.present? && artist_search.empty?
  end

end
