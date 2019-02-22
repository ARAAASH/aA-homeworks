class CatRentalRequest < ApplicationRecord
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(APPROVED DENIED PENDING) }
  validate :does_not_overlap_approved_request

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
      p overlapping_pending_requests
      overlapping_pending_requests.each { |req| req.status = "DENIED" }
    end
  end

  private
  def overlapping_pending_requests
    overlapping_requests.select { |req| req.status == "PENDING" }
  end

  def does_not_overlap_approved_request
    unless overlapping_approved_requests.empty?
      errors[:base] << "There is an overlapping approved request for this cat!"
    end
  end

  def overlapping_approved_requests
    overlapping_requests.select {|req| req.status == "APPROVED"}
  end

  def overlapping_requests
    cat_rentals = CatRentalRequest.where(cat_id: self.cat_id)
    res = []
    cat_rentals.each do |cat_rent|
      res << cat_rent if overlap_time?(cat_rent)
    end
    res
  end

  def overlap_time?(rent)
    (rent.start_date >= self.start_date || rent.end_date <= self.start_date)
  end
end
