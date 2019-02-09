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

  def self.factory!(user, long_url)
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

  has_many :visits,
    class_name: 'Visit',
    foreign_key: :shortenedurl_id,
    primary_key: :id


  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  has_many :taggings,
    class_name: :Tagging,
    foreign_key: :shortenedurl_id,
    primary_key: :id

  has_many :topics
    thourgh: :taggings
    source: :tag_topic

  def num_clicks
    self.visits.length
  end

  def num_uniques
    visits.select('user_id').distinct.count

  end

  def num_recent_uniques
    visits
      .select('user_id')
      .where('created_at < ?', 10.minutes.ago)
      .distinct.count
  end

end
