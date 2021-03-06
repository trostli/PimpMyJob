require 'Faker'

def location_helper(coordinate_type)
  chance = rand(2)+1
  case coordinate_type
  when :latitude
    if chance == 2
      (32.742815 * (rand/1000 + 1))
    elsif chance == 1
      (32.742815 * (-rand/1000 + 1))
    end
  when :longitude
      if chance == 2
      (-117.141091 * (rand/1000 + 1))
    elsif chance == 1
      (-117.141091 * (-rand/1000 + 1))
    end
  end
end


@categories = %w(accounting+finance admin/office arch/engineering art/media/design biotech/science business/mgmt customer-service education food/bev/hosp general-labor government human-resources internet-engineers legal/paralegal manufacturing marketing/pr/ad medical/health nonprofit real-estate retail/wholesale sales/bizdev salon/spa/fitness security trade/craft software/qa/dba systems/network technical-support transport tv/film/video web/info-design writing/editing)


@categories.each do |category|
  Category.create(name: category)
end

200.times do |i|
  job_attributes = {
    :category_id => rand(@categories.length)+1,
    :title => Faker::Name.title,
    :company => Faker::Company.name,
    :compensation => "$" + ((rand(10)+1) * (rand(10)+1) + 7).to_s + " an hour",
    :description => Faker::Lorem.paragraph,
    :address => Faker::Address.street_address,
    :latitude => location_helper(:latitude),
    :longitude => location_helper(:longitude),
  }
  Job.create(job_attributes)
end
