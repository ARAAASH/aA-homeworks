class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    class_name: :Artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    dependent: :destroy

  has_many :artwork_views,
    class_name: :ArtworkShare,
    primary_key: :id,
    foreign_key: :viewer_id,
    dependent: :destroy

  has_many :artwork_shares,
    through: :artwork_views,
    source: :artwork,
    dependent: :destroy

  has_many :comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :user_id,
    dependent: :destroy

  has_many :likes,
    class_name: :Like,
    primary_key: :id,
    foreign_key: :user_id

  has_many :like_comments,
    through: :likes,
    source: :likeable,
    source_type: :Comment

  has_many :like_artworks,
    through: :likes,
    source: :likeable,
    source_type: :Artwork



end
