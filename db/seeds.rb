rooms = [{:name => 'Testing Room', :roomtype => 'Executive Room',
        :description=> 'nothing fancy', :occupied=>true, :booker=>'estee', 
        :operate_start=> Time.parse("01-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")},
        {:name => 'Room 404', :roomtype => '???',
        :description=> 'zzz', :occupied=>true, :booker=>'estee', 
        :operate_start=> Time.parse("04-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")}
        
        ]

rooms.each do |room|
    Room.create!(room)
end

users = [{:name => "Testing User", :email => "rsquared.rooms@gmail.com",
        :usertype => "Admin"},
        {:name => "Estee", :email => "estee.tsw@gmail.com",
        :usertype => "Student"}]

users.each do |user|
    User.create!(user)
end

bookings = [{:room_id => 1, :booker_id => 1, 
            :reason => "I just wanna sleep ok, nothing new or fancy", 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30)}
            ]
            
bookings.each do |booking|
    Booking.create!(booking)
end