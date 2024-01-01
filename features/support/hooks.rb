Before do 

  cloud = ENV['CLOUD']

  if (cloud == true) 
  caps = Appium.load_appium_txt file: File.expand_path('caps_appium/android.txt', __dir__), verbose: true
  Appium::Driver.new(caps, true)
  Appium.promote_appium_methods Object

  @driver.start_driver
  @driver.set_wait(DEFAULT_HOLD)
end 
