require 'rails_helper'

RSpec.describe AdvancedsearchController, type: :controller do
    before(:all) do
        @search_complete = create(:searching, 
            startDate: Faker::Date,
            endDate: Faker::Date,
            startTime: Faker::Time,
            endTime: Faker::Time
        )
        #@search_missing_start_date
        #@search_missing_end_date
        #@search_missing_start_time
        #@search_missing_end_time
    end
    
    it "is valid with complete parameters" do
        expect(@search_complete).to be_valid
    end

end
