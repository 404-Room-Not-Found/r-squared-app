class Booking < ActiveRecord::Base
    validates :building_name, presence: true
    validates :room_id, presence: true
    validates :booker_id, presence: true
    validates :time_start, presence: true
    validates :time_end, presence: true
    validate :time_overlaps
    
    scope :in_range, -> range {
      where('(\'from\' BETWEEN ? AND ?)', range.first, range.last)
    }
    scope :exclude_self, -> id { where.not(id: id) }
    
    def time_overlaps
        range = Range.new time_start, time_end
        overlaps = Booking.exclude_self(room_id).in_range(range)
        overlap_error unless overlaps.empty?
    end
    
    def overlap_error
      errors.add(:overlap_error, 'There is already an event scheduled in this hour!')
    end
    
    # scope :overlap, -> { |booking|
    #     where("id <> ? AND time_start <= ? AND ? <= end_date", booking.room_id, booking.time_end, booking.time_start)
    # }
end
