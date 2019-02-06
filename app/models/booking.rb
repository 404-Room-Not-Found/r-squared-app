class Booking < ActiveRecord::Base
    validates :building_name, presence: true
    validates :room_id, presence: true
    validates :booker_id, presence: true
    validates :time_start, presence: true
    validates :time_end, presence: true
    validate :time_overlaps
end
