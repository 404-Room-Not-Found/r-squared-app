require "rails_helper"
RSpec.describe Room, :type => :model do
  
  before(:all) do
    @test_room_complete = Room.new(
      building_name: "Building 5", room_id => 2, roomtype => 'Executive Room',
        description=> 'test desc', occupied=>true, booker=>'Testing User', 
        operate_start=> Time.parse("01-01-19 08:00"),
        operate_end =>  Time.parse("04-01-19 19:00"))
    @test_room_basic = Room.new(room_id => 123, roomtype => 'Lecture Hall',
        operate_start=> Time.parse("06-06-18 08:00"),
        operate_end =>  Time.parse("09-09-18 19:00"))
    
  end
  
  it "is valid with only basic attributes filled up" do
    expect(@test_room_basic).to be_valid
  end
  
  it "can be created only with a unique room_id" do
    duplicate_room = build(:user, room_id => 2, roomtype => 'Study room',
        operate_start=> Time.parse("06-06-18 08:00"),
        operate_end =>  Time.parse("09-09-18 19:00"))
    expect(duplicate_room).to_not be_valid
  end
  
  it "updates optional attributes successfully with correct parameters" do
      @test_room_basic.building_name = "THE NEW BUILDING"
      @test_room_basic.description = "test description"
      expect(@test_room_basic).to be_valid
    end
    
  it "fails to update with missing parameters" do
    @test_room_basic.operate_start = nil
    expect(@test_room_basic).to_not be_valid
  end
  
    
  it "can be created with both basic and optional attributes filled up" do
    expect(@test_room_complete).to be_valid
  end
  
  it "is not valid without operating start hours" do 
    @test_room_basic.operate_start = nil
    expect(@test_room_basic).to_not be_valid
  end
  
  it "is not valid without operating end hours" do
    testroom = build(:user, email: nil)
    expect(testroom).to_not be_valid
  end
end