#/usr/bin/env ruby

require 'json'
require 'date'

def get_random_difference
  (rand(2) == 1) ? 1 : -1
end

tags = [
  'Well 1 Steam Rate (BSPD)',
  'Well 2 Steam Rate (BSPD)',
  'Well 3 Steam Rate (BSPD)',
  'Well 4 Steam Rate (BSPD)'
]

json_object = {}

tags.each do |tag|
  date = DateTime.new(1991, 01, 01)
  last_value = 100
  difference = get_random_difference

  json_object[tag] = {}
  10000.times do |i|
    point_value = (last_value + difference)
    point_value = 0 if point_value < 0

    json_object[tag].store(date.to_s, point_value)

    last_value = point_value
    date += 1
    difference = get_random_difference
  end
end

File.open('/tmp/json-dump.json', 'w') do |f|
  f.puts(JSON.pretty_generate(json_object))
end
