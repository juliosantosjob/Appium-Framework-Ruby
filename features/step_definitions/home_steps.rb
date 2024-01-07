Given("the access user home") do
  home_screens.open_app
end

When("he selects an option show value") do
  home_screens.select_show_balance
end

Then("displays its value: {string}") do |value|
  get_balance = home_screens.user_balance
  expect(get_balance).to eq(value)
end

When("select option transfer") do
  home_screens.select_transfer
end

And("search a contact") do
  home_screens.fill_contact
end

Then("displays the searched contact") do
  contact = home_screens.contact_view
  expect(contact).to be_truthy
end
