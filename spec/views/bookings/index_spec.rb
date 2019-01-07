require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
    it "displays title" do
        render
        expect(rendered).to have_css('h1', text: "Recent Bookings")
    end
    
    it "display table if have data" do
        Booking.create!(:room_id => 1, :booker_id => 1, 
            :time_start=> Time.new(2011, 11, 1, 10, 30),
            :time_end=>Time.new(2014, 11, 1, 10, 30))
        User.create!(:name => "Estee", :email => "estee.tsw@gmail.com",
        :password => "1234",
        :usertype => "Student")
        Room.create!(:building_name => 'HRBB', :room_id => 1, :roomtype => 'Lecture Hall',
        :description=> 'Regular lecture hall', 
        :operate_start=> Time.parse("04-01-19 08:00"),
        :operate_end =>  Time.parse("04-01-19 19:00"))
        
        render
        expect(rendered).to have_css 'table'
    end
    
    it "display in-line message if have no data" do
        Booking.delete_all
        render
        expect(rendered).to have_css("p", text: "No bookings found.")
        expect(rendered).to_not have_css "table"
    end
    
end