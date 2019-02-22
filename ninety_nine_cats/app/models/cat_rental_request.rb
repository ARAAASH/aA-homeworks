class CatRentalRequest < ApplicationRecord
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(APPROVED DENIED PENDING) }
  validate :does_not_overlap_approved_request
  validate :start_must_come_from_before_end

  belongs_to :cat,
    class_name: :Cat,
    primary_key: :id,
    foreign_key: :cat_id

  def pending?
    self.status == "PENDING"
  end

  def deny!
    self.status = "DENIED"
    self.save
  end

  def approve!
    self.transaction do
      self.status = "APPROVED"
      self.save
      overlapping_pending_requests.each do |req|
        req.update!(status: "DENIED")
      end
    end
  end

  private
  def overlapping_pending_requests
    overlapping_requests.where("status= \'PENDING\'")
  end

  def does_not_overlap_approved_request
    return if self.status == "DENIED"

    unless overlapping_approved_requests.empty?
      errors[:base] << "There is an overlapping approved request for this cat!"
    end
  end

  def overlapping_approved_requests
    overlapping_requests.where("status= \'APPROVED\'")
  end

  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat_id)
      .where.not(id: self.id)
      .where.not("start_date > :end_date OR end_date < :start_date",
                start_date: self.start_date, end_date: self.end_date)

  end

  def start_must_come_from_before_end
    return if self.start_date < self.end_date
    errors[:start_date] << "must come before end date"
    errors[:end_date] << "must come after start date "
  end

end
