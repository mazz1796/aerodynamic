class Car < ActiveRecord::Base
  belongs_to :user
  has_many :photos


  validates :body_type, presence: true
  validates :brand, presence: true
  validates :accommodate, presence: true
  validates :transmission, presence: true
  validates :drive_type, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length: {maximum: 500}
  validates :address, presence: true
end
