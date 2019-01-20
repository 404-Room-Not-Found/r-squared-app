class Booking < ActiveRecord::Base
    validates :building_name, presence: true
    validates :room_id, presence: true
    validates :booker_id, presence: true
    validates :time_start, presence: true
    validates :time_end, presence: true
    validate :time_overlaps
    
    def time_overlaps(other)
        time_start <= other.time_end && other.time_start <= time_end
    end
    
    # scope :overlap, -> { |booking|
    #     where("id <> ? AND time_start <= ? AND ? <= end_date", booking.room_id, booking.time_end, booking.time_start)
    # }
end
