
def location_helper(coordinate_type)
  chance = rand(2)+1
  case coordinate_type
  when :latitude
    if chance == 2
      (37.768815 * (rand/1000 + 1))
    elsif chance == 1
      (37.768815 * (-rand/1000 + 1))
    end
  when :longitude
      if chance == 2
      (-122.439736 * (rand/2000 + 1))
    elsif chance == 1
      (-122.439736 * (-rand/2000 + 1))
    end
  end
end


200.times do |i|
  photo_attributes = {
    :insta_id => i,
    :latitude => location_helper(:latitude),
    :longitude => location_helper(:longitude),
    :location_name => Faker::Address.street_name,
    :created_time => rand(86400) + 1383202800,
    :like_count => rand(20),
    :link => 'http://instagram.com/p/gKaFkat0Tj/' ,
    :thumbnail_url => "http://origincache-prn.fbcdn.net/1173089_566382760098534_103778226_s.jpg",
    :caption => Faker::Lorem.words.map { |word| "#"+word }.join(" ")
  }
  Photo.create(photo_attributes)
end

