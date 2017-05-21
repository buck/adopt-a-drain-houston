User.where(email: 'lesterbuck@gmail.com').first_or_initialize.tap do |user|
  user.first_name = 'lesterbuck'
  user.last_name = 'Buck'
  user.password = 'buckster'
end


HOUSTON_LAT_RANGE = 29.72..29.75
HOUSTON_LONG_RANGE = -95.37..-95.35

r = Random.new

500.times do |i|
  Thing.where(city_id: i).first_or_initialize.tap do |thing|
    thing.name = "Some Drain #{i}"
    thing.lat = r.rand(HOUSTON_LAT_RANGE)
    thing.lng = r.rand(HOUSTON_LONG_RANGE)
    thing.system_use_code = ['MS4', 'STORM', 'COMB', 'UNK'].sample
    thing.save!
  end
end
