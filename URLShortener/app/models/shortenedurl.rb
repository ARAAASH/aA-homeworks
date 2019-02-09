class Shortenedurl < ApplicationRecord
  require 'securerandom'
  validates :user_id, :short_url, :long_url, uniqueness: true, presence: true
  validate :no_spamming
  validate :nonpremium_max

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

  has_many :topics,
    through: :taggings,
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

  private
  def no_spamming
    max_num = Shortenedurl
      .where('created_at >= ?', 1.minute.ago)
      .where('user_id == ?', self.user_id)
      .length

    errors[:max_num] << 'of five short urls per minute' if max_num >= 5
  end

  def nonpremium_max
    if self.submitter.premium == false
      max = Shortenedurl
        .where('user_id == ?', self.user_id)
        .length

      errors[:error] << ': non-premium cannot submit more than five' if max >= 5
    end

  end

end
