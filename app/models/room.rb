class Room < ActiveRecord::Base
    validates :building_name, presence: true
    validates_uniqueness_of :room_id, :scope => :building_name
    validates :room_id, presence: true
    
    after_initialize :set_defaults, unless: :persisted?
    # The set_defaults will only work if the object is new
    
    def set_defaults
        self.booked  ||= false if self.booker.nil?
        self.booker = "---" if self.booker.nil?
    end
end
