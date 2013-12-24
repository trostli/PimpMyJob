class Job < ActiveRecord::Base

  attr_accessible :title, :compensation, :description, :address, :latitude, :longitude
  validates :title, :description, :address, :latitude, :longitude , presence: true

end