class Room < ActiveRecord::Base
    include Filterable
    validates :building_name, presence: true
    validates_uniqueness_of :room_id, :scope => :building_name
    validates :room_id, presence: true
    
    after_initialize :set_defaults, unless: :persisted?
    # The set_defaults will only work if the object is new
    
    def set_defaults
        self.booked  ||= false if self.booker.nil?
        self.booker = "---" if self.booker.nil?
    end
    
    scope :building_name, -> (building_name) { where building_name: building_name }
    scope :roomtype, -> (roomtype) { where roomtype: roomtype }
    scope :numpeople, -> (numpeople) { where numpeople: numpeople }
    scope :arrangement, -> (arrangement) { where arrangement: arrangement }
    scope :tech, -> (tech) { where tech: tech }
#   scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end
