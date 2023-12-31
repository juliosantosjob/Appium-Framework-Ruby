Given('the access user home') do
  @app_screens = App_Screens.new
  @app_screens.open_app
end

When('he selects an option show value') do
  @app_screens.select_show_balance
end 

Then('displays its value: {string}') do |value|
  get_balance = @app_screens.value_user_balance
  expect(get_balance).to eq(value)
end
