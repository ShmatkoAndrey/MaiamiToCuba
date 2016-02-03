Ferry.create(name: "BigFoot", typeship: "large")
Ferry.create(name: "Lion", typeship: "small")

(3..28).each do |i|
  if i%2 == 0
    Timetable.create(date: DateTime.new(2016,2,i,10,0), ferry_id: 1, direction: 'Maiami')
    Timetable.create(date: DateTime.new(2016,2,i,17,0), ferry_id: 2, direction: 'Cuba')
  else
    Timetable.create(date: DateTime.new(2016,2,i,15,0), ferry_id: 2, direction: 'Maiami')
    Timetable.create(date: DateTime.new(2016,2,i,12,0), ferry_id: 1, direction: 'Cuba')
  end
end


(0..6).each do |i|
  Place.create(ferry_id: 1, name: "AA#{i+1}", price: 4)
  Place.create(ferry_id: 1, name: "AB#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "AC#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "BA#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "BB#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "BC#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "DA#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "DB#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "DC#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "EA#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "EB#{i+1}", price: 3)
  Place.create(ferry_id: 1, name: "EC#{i+1}", price: 3)
end
(0..16).each do |i|
  Place.create(ferry_id: 1, name: "CA#{i+1}", price: 2)
  Place.create(ferry_id: 1, name: "CB#{i+1}", price: 2)
  Place.create(ferry_id: 1, name: "CC#{i+1}", price: 2)
end

(0..16).each do |i|
  Place.create(ferry_id: 2, name: "AA#{i+1}", price: 5)
  Place.create(ferry_id: 2, name: "AB#{i+1}", price: 5)
  Place.create(ferry_id: 2, name: "AC#{i+1}", price: 5)
  Place.create(ferry_id: 2, name: "BA#{i+1}", price: 5)
  Place.create(ferry_id: 2, name: "BB#{i+1}", price: 5)
  Place.create(ferry_id: 2, name: "BC#{i+1}", price: 5)
end