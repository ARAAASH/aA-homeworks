class TagTopic < ApplicationRecord
  validates :name, presence: true

  has_many :taggings,
    class_name: :Tagging,
    foreign_key: :tag_topic_id,
    primary_key: :id

  has_many :urls,
    through: :taggings,
    source: :shortenedurl

  def popular_links
    urls.join(:visits)
      .group(:short_url)
      .order('COUNT(visits.id) DESC')
      .select(urls.short_url, urls.long_url, COUNT(visits.id))
      .limit(5)
  end
end
