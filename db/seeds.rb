rooms = [{:building_name => 'HRBB', :room_id => 126, :roomtype => 'Executive Room',
        :description=> 'nothing fancy', :booked=>true, :booker=>'estee', 
        :operate_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
        :operate_end =>  DateTime.parse('5th Feb 2001 04:05:06 PM')},
        {:building_name => 'HRBB', :room_id => 124, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'Admin', 
        :operate_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
        :operate_end =>  DateTime.parse('5th Feb 2001 04:05:06 PM')},
        {:building_name => 'HRBB', :room_id => 129, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'amy', 
        :operate_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
        :operate_end =>  DateTime.parse('5th Feb 2001 04:05:06 PM')},
        {:building_name => 'HRBB', :room_id => 113, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'anthony', 
        :operate_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
        :operate_end =>  DateTime.parse('5th Feb 2001 04:05:06 PM')},
        {:building_name => 'HRBB', :room_id => 104, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', :booked=>true, :booker=> 'jordan', 
        :operate_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
        :operate_end =>  DateTime.parse('5th Feb 2001 04:05:06 PM')},
        {:building_name => 'HRBB', :room_id => 105, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall',
        :operate_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
        :operate_end =>  DateTime.parse('5th Feb 2001 04:05:06 PM')}
        
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
            :reason => "Admin just wanna sleep ok, nothing new or fancy", 
            :time_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
            :time_end=>DateTime.parse('5th Feb 2001 04:05:06 PM')},
            {:room_id => 2, :booker_id => 2, 
            :reason => "Estee just wanna sleep ok, nothing new or fancy", 
            :time_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
            :time_end=>DateTime.parse('5th Feb 2001 04:05:06 PM')},
            {:room_id => 3, :booker_id => 3, 
            :reason => "Kim just wanna sleep ok, nothing new or fancy", 
            :time_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
            :time_end=>DateTime.parse('5th Feb 2001 04:05:06 PM')},
            {:room_id => 4, :booker_id => 4, 
            :reason => "Jordan just wanna sleep ok, nothing new or fancy", 
            :time_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
            :time_end=>DateTime.parse('5th Feb 2001 04:05:06 PM')},
            {:room_id => 5, :booker_id => 5, 
            :reason => "Amy just wanna sleep ok, nothing new or fancy", 
            :time_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
            :time_end=>DateTime.parse('5th Feb 2001 04:05:06 PM')},
            {:room_id => 6, :booker_id => 4, 
            :reason => "Anthony just wanna sleep ok, nothing new or fancy", 
            :time_start=> DateTime.parse('5th Feb 2001 04:05:06 PM'),
            :time_end=>DateTime.parse('5th Feb 2001 04:05:06 PM')}
            ]
            
bookings.each do |booking|
    Booking.create!(booking)
end