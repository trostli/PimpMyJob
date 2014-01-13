require 'csv-mapper'

include CsvMapper

results = import('test.csv') do
  map_to Job # Map to the Person ActiveRecord class (defined above) instead of the default OpenStruct.
  after_row lambda{|row, person| person.save }  # Call this lambda and save each record after it's parsed.

  start_at_row 1
  [category_id, title, description, compensation, address, latitude, longitude, created_at, updated_at, company]
end