def self.create_places(type, id)
  if type == 'small'
    (0..17).each do |i|
      Place.create(ferry_id: id, name: "AA#{i+1}", price: 5)
      Place.create(ferry_id: id, name: "AB#{i+1}", price: 5)
      Place.create(ferry_id: id, name: "AC#{i+1}", price: 5)
      Place.create(ferry_id: id, name: "BA#{i+1}", price: 5)
      Place.create(ferry_id: id, name: "BB#{i+1}", price: 5)
      Place.create(ferry_id: id, name: "BC#{i+1}", price: 5)
    end
  elsif type == 'large'
    (0..7).each do |i|
      Place.create(ferry_id: id, name: "AA#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "AB#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "AC#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "BA#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "BB#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "BC#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "DA#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "DB#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "DC#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "EA#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "EB#{i+1}", price: 3)
      Place.create(ferry_id: id, name: "EC#{i+1}", price: 3)
    end
    (0..17).each do |i|
      Place.create(ferry_id: id, name: "CA#{i+1}", price: 2)
      Place.create(ferry_id: id, name: "CB#{i+1}", price: 2)
      Place.create(ferry_id: id, name: "CC#{i+1}", price: 2)
    end
  end
end

Ferry.create(name: "BigFoot", typeship: "large")
Ferry.create(name: "Lion", typeship: "small")

(3..28).each do |i|
  if i%2 == 0
    Timetable.create(date: DateTime.new(2016,2,i,10,0),date_arrival: DateTime.new(2016,2,i,22,0), ferry_id: 1, direction: 'Miami')
    Timetable.create(date: DateTime.new(2016,2,i,17,0),date_arrival: DateTime.new(2016,2,i+1,10,0), ferry_id: 2, direction: 'Cuba')
  else
    Timetable.create(date: DateTime.new(2016,2,i,15,0),date_arrival: DateTime.new(2016,2,i+1,8,0), ferry_id: 2, direction: 'Miami')
    Timetable.create(date: DateTime.new(2016,2,i,12,0),date_arrival: DateTime.new(2016,2,i+1,1,0), ferry_id: 1, direction: 'Cuba')
  end
end


create_places('large', 1)
create_places('small', 2)