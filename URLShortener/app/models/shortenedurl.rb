class Shortenedurl < ApplicationRecord
  require 'securerandom'
  validates :user_id, :short_url, :long_url, uniqueness: true, presence: true

  def self.random_code
    SecureRandom.urlsafe_base64
  end

end
