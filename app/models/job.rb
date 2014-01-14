require "csv"

class Job < ActiveRecord::Base
  validates :title, :description, :address, :latitude, :longitude , presence: true
  belongs_to :category

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Job.create! row.to_hash
    end
  end

end