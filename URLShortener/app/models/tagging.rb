class Tagging < ApplicationRecord
  validates :tag_topic_id, presence: true
  validates :shortenedurl_id, presence: true

  belongs_to :shortenedurl,
    class_name: :Shortenedurl,
    foreign_key: :shortenedurl_id,
    primary_key: :id

  belongs_to :tag_topic,
    class_name: :TagTopic,
    foreign_key: :tag_topic_id,
    primary_key: :id
end
