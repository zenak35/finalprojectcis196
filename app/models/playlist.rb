class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tracks
  accepts_nested_attributes_for :tracks, reject_if: :all_blank
  validates :name, presence: true, uniqueness: true

  def created_at_formatted
    created_at.in_time_zone('EST').strftime('%b %e, %Y at %l:%M%p')
  end
  
end
