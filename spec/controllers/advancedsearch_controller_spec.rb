require 'rails_helper'

RSpec.describe AdvancedsearchController, type: :controller do
    before(:all) do
        @search_complete = Search.new(
            start_date: Faker::Date, 
            end_date: Faker::Date, 
            start_time: Faker::Time, 
            end_time: Faker::Time
        )
                
        @search_missing_start_date
        @search_missing_end_date
        @search_missing_start_time
        @search_missing_end_time
    end
    
    it "is valid with complete parameters" do
        expect(@search_complete).to be_valid
    end

end
