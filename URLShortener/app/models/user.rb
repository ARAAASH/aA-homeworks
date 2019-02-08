class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_urls,
    class_name: 'Shortenedurl',
    foreign_key: :user_id,
    primary_key: :id
  )
end
