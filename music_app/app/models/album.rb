class Album < ApplicationRecord

  validates :title, :year, :band_id, presence: true
  validates :type, inclusion: { in: %w(studio live)  }

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id,
    primary_key: :id,
    optional: true

end
