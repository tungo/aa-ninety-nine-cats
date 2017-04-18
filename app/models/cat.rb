class Cat < ActiveRecord::Base
  COLORS = [
    "yellow",
    "black",
    "white",
    "gray",
    "orange",
    "colorful"
  ]

  SEXES = [
    "M",
    "F"
  ]

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: SEXES

  has_many :rental_requests,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

  def age
    Date.today.year - birth_date.year
  end
end
