Given("Im at the homepage") do
 visit home_path
end

Then("I should see the reservation") do
   expect(page).to have_content("My Reservation")

end
