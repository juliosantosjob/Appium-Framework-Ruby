Before do 
  cloud = ENV['CLOUD']

  begin
    if (cloud == 'true') 
      filePath = File.join(__dir__,'caps', 'android_browserstack.yml')
      caps_data = YAML.load_file(filePath)

      CAPS_BS = caps_data['caps_bs']
      Appium::Driver.new(CAPS_BS, true)
      Appium.promote_appium_methods Object
    else
      filePath = File.join(__dir__,'caps', 'android_appium.yml')
      caps_data = YAML.load_file(filePath)
      
      CAPS_AP = caps_data['caps_ap']
      Appium::Driver.new(CAPS_AP, true)
      Appium.promote_appium_methods Object
  rescue Exception => e
      puts e.message
      Process.exit(0)
end

  @driver.start_driver
  @driver.set_wait(DEFAULT_HOLD)
end 
