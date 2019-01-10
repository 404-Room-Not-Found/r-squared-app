require "rails_helper"
RSpec.describe Booking, :type => :model do
  
  before(:all) do
    @test_Booking = Booking.new(
     :building_name => 'HRBB', :room_id => 2, :booker_id => 2, 
            :reason => "Estee just wanna sleep ok, nothing new or fancy", 
            :time_start=> DateTime.parse('3rd Feb 2001 04:05:06 PM'),
            :time_end=>DateTime.parse('5th Feb 2001 04:05:06 PM'))
  end
  
  it "is valid with all attributes filled up" do
    expect(@test_room_basic).to be_valid
  end
  
  it "is invalid with missing info (building name)" do
    @test_Booking.building_name = nil
    expect(@test_Booking).to_not be_valid
  end
  
  it "is invalid with missing info (room id)" do
    @test_Booking.building_name = 'HRBB'
    @test_Booking.room_id = nil
    expect(@test_Booking).to_not be_valid
  end
  
  it "is invalid with missing info (booker id)" do
    @test_Booking.room_id = 2
    @test_Booking.booker_id = nil
    expect(@test_Booking).to_not be_valid
  end
  
  it "is invalid with missing info (time start)" do
    @test_Booking.booker_id = 2
    @test_Booking.time_start = nil
    expect(@test_Booking).to_not be_valid
  end
  
  it "is invalid with missing info (time begin)" do
    @test_Booking.time_start = DateTime.parse('3rd Feb 2001 04:05:06 PM')
    @test_Booking.time_end = nil
    expect(@test_Booking).to_not be_valid
  end
  
  it "is valid with missing reason" do
      @test_Booking.time_end = DateTime.parse('5th Feb 2001 04:05:06 PM')
      @test_Booking.reason = nil
      expect(@test_room_basic).to be_valid
    end
  
end  
>>>>>>> master
