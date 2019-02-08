class Shortenedurl < ApplicationRecord
  require 'securerandom'
  validates :user_id, :short_url, :long_url, uniqueness: true, presence: true

  def self.random_code
    while(1)
      short = SecureRandom.urlsafe_base64
      break unless self.exists?(:short_url => short)
    end
    short
  end

  def self.factory(user, long_url)
    user_id = user.id
    short_url = self.random_code
    self.create!({:user_id => user_id, :short_url => short_url, :long_url => long_url})
  end

  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

end
