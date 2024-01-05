Given("the access user home") do
  app_screens.open_app
end

When("he selects an option show value") do
  app_screens.select_show_balance
end

Then("displays its value: {string}") do |value|
  get_balance = app_screens.user_balance
  expect(get_balance).to eq(value)
end

When("select option transfer") do
  app_screens.select_transfer
end

When("search a contact") do
  app_screens.fill_contact
end

Then("displays the searched contact") do
  contact = app_screens.contact_view
  expect(contact).to be_truthy
end
