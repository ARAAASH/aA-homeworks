class Track < ApplicationRecord

  TTYPE = %w(regular bonus)

  validates :album_id, :title, :ord, presence: true
  validates :type_track, inclusion: { in: TTYPE }

  
end
