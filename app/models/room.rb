class Room < ActiveRecord::Base
    validates :building_name, presence: true
    validates :room_id, presence: true, uniqueness: true #{ scope: :building_name }
    
    after_initialize :set_defaults, unless: :persisted?
    # The set_defaults will only work if the object is new
    
    def set_defaults
        self.booked  ||= false if self.booker.nil?
    end
end
