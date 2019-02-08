class Visit < ApplicationRecord
  validates :user_id, presence: true
  validates :shortenedurl_id, presence: true

  def self.record_visit!(user, shortened_url)
    self.create!({:user_id => user.id, :shortenedurl_id => shortened_url.id})
  end

  belongs_to :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :shortenend_url,
    class_name: 'Shortenedurl',
    foreign_key: :shortenedurl_id,
    primary_key: :id


end
