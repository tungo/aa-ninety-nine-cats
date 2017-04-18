class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: ["yellow", "black", "white", "gray", "orange", "colorful"]
  validates :sex, inclusion: ["M", "F"]

  def age
    Date.today.year - birth_date.year
  end
end
