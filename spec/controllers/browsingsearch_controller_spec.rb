require 'rails_helper'

RSpec.describe BrowsingsearchController, type: :controller do
    before(:all) do
        visit browsingsearch_path
    end
    
    it "redirects to RDMC-specific Rooms" do
        click_link 'RDMC'
        expect(page.current_path).to eq rdmc_path
    end
    
    it "redirects to HRBB-specific rooms" do
        click_link 'HRBB'
        expect(page.current_path).to eq bright_path
    end
    
    it "redirects to All-Rooms" do
        click_link 'All Rooms'
        expect(page.current_path).to eq rooms_path
    end
end
