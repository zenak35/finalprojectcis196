class User < ApplicationRecord
  include BCrypt
  has_many :playlists, dependent: :destroy
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :first_name_capitalized, :last_name_capitalized, :correct_email

  def full_name
    "#{first_name} #{last_name}"
  end

   def password
    @password = Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def first_name_capitalized
    errors.add(:first_name, 'must be capitalized') if first_name && first_name.capitalize!
  end

  def last_name_capitalized
    errors.add(:last_name, 'must be capitalized') if last_name && last_name.capitalize!
  end

  def correct_email
    errors.add(:email, "must have an '@' and a '.'") if email && (!email.include?('@') || !email.include?('.'))
  end
end
