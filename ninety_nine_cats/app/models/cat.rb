require 'date'

class Cat < ApplicationRecord
  COLORS = %w(gray black white)

  validates :birth_date, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(F M) }
  validates :description, presence: true

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    primary_key: :id,
    foreign_key: :cat_id,
    dependent: :destroy

  def age
    Date.now.year - self.birth_date.year
  end
end
