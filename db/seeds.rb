rooms = [{:building_name => 'HRBB', :room_id => 126, :roomtype => 'Executive Room',
        :description=> 'nothing fancy', :booked=>true, :booker=>'estee', 
        :operate_start=> Time.parse("01-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")},
        {:building_name => 'HRBB', :room_id => 124, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'Admin', 
        :operate_start=> Time.parse("04-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")},
        {:building_name => 'HRBB', :room_id => 129, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'amy', 
        :operate_start=> Time.parse("04-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")},
        {:building_name => 'HRBB', :room_id => 113, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'anthony', 
        :operate_start=> Time.parse("04-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")},
        {:building_name => 'HRBB', :room_id => 104, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'jordan', 
        :operate_start=> Time.parse("04-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")},
        {:building_name => 'HRBB', :room_id => 115, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'anthony', 
        :operate_start=> Time.parse("04-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00")},
        
        ]

rooms.each do |room|
    Room.create!(room)
end

users = [{:name => "Admin", :email => "rsquared.rooms@gmail.com",
        :password => "1234",
        :usertype => "Admin"},
        {:name => "Estee", :email => "estee.tsw@gmail.com",
        :password => "1234",
        :usertype => "Student"},
        {:name => "Kim", :email => "knguyen@gmail.com",
        :password => "1234",
        :usertype => "Student"},
        {:name => "Jordan", :email => "jmoore@gmail.com",
        :password => "1234",
        :usertype => "Student"},
        {:name => "Amy", :email => "ahughes@gmail.com",
        :password => "1234",
        :usertype => "Student"},
        {:name => "Anthony", :email => "avoneiff@gmail.com",
        :password => "1234",
        :usertype => "Student"}]

users.each do |user|
    User.create!(user)
end

bookings = [{:room_id => 1, :booker_id => 1, 
            :reason => "I just wanna sleep ok, nothing new or fancy", 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30)},
            {:room_id => 2, :booker_id => 2, 
            :reason => "I just wanna sleep ok, nothing new or fancy", 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30)},
            {:room_id => 3, :booker_id => 3, 
            :reason => "I just wanna sleep ok, nothing new or fancy", 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30)},
            {:room_id => 4, :booker_id => 4, 
            :reason => "I just wanna sleep ok, nothing new or fancy", 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30)},
            {:room_id => 5, :booker_id => 5, 
            :reason => "I just wanna sleep ok, nothing new or fancy", 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30)},
            {:room_id => 6, :booker_id => 4, 
            :reason => "I just wanna sleep ok, nothing new or fancy", 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30)}
            ]
            
bookings.each do |booking|
    Booking.create!(booking)
end