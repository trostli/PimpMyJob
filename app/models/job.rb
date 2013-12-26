class Job < ActiveRecord::Base
  validates :title, :description, :address, :latitude, :longitude , presence: true
  belongs_to :category
end