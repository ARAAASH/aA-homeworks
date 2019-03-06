class Goal < ApplicationRecord
  KIND = %w(public private)
  COMP = %w(yes no)

  validates :description, :user_id, presence: true
  validates :ttype, inclusion: { in: KIND }
  validates :completed?, inclusion: { in: COMP }

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id,
    optional: true

end
