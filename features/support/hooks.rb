Before do 
  cloud = ENV['CLOUD']

  begin
    if (cloud == 'true') 
      filePath = File.join(__dir__,'caps', 'android_browserstack.yml')
      caps_data = YAML.load_file(filePath)

      CAPS_BS = caps_data[]
      Appium::Driver.new(caps, true)
      Appium.promote_appium_methods Object
    else
      caps = Appium.load_appium_txt file: File.expand_path('caps_appium/android.txt', __dir__), verbose: true
      Appium::Driver.new(caps, true)
      Appium.promote_appium_methods Object
   rescue Exception => e
      puts e.message
      Process.exit(0)
end

  @driver.start_driver
  @driver.set_wait(DEFAULT_HOLD)
end 
