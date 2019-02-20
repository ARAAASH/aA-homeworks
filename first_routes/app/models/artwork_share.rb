class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true
  validates :viewer_id, uniqueness: { scope: :artwork_id }

  belongs_to :artwork,
    class_name: :Artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    optional: true

  belongs_to :viewer,
    class_name: :User,
    primary_key: :id,
    foreign_key: :viewer_id,
    optional: true
end
