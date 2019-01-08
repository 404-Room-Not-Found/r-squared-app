class Room < ActiveRecord::Base
    validates :building_name, presence: true
    validates :room_id, presence: true, uniqueness: true #{ scope: :building_name }
    validates :booked, inclusion: { in: [true, false] }
end
