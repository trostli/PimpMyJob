
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


@categories = %w(accounting+finance admin/office arch/engineering art/media/design biotech/science business/mgmt customer service education food/bev/hosp general labor government human resources internet engineers legal/paralegal manufacturing marketing/pr/ad medical/health nonprofit sector real estate retail/wholesale sales/biz dev salon/spa/fitness security skilled trade/craft software/qa/dba systems/network technical support transport tv/film/video web/info design writing/editing)


@categories.each do |category|
  Category.create(name: category)
end

200.times do |i|
  category_name = category_helper

  job_attributes = {
    :category_id: rand(@categories.length)+1
    :title => i,
    :company => Faker::Company.name,
    :compensation => "$" + Faker::Number(2).to_s + " an hour",
    :description => Faker::Lorem.paragraph,
    :address => Faker::Address.street_address,
    :latitude => location_helper(:latitude),
    :longitude => location_helper(:longitude),
  }
  Job.create(job_attributes)
end
