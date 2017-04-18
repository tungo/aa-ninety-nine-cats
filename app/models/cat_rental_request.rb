class CatRentalRequest < ActiveRecord::Base
  STATUSES = [
    "PENDING",
    "APPROVED",
    "DENIED"
  ]

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUSES
  validate :does_not_overlap_approved_request
  validate :cat_exists

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat


  def overlapping_requests
    CatRentalRequest.where(cat_id: cat_id)
      .where("end_date > ?", start_date)
      .where.not(id: id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:start_date] << "Overlaps with other rental"
    end
  end

  def cat_exists
    cat = Cat.exists?(cat_id)
    unless cat
      errors[:cat_id] << "Must exist"
    end
  end
end
