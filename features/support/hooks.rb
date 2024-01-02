Before do
  caps = Appium.load_appium_txt file: File.join(__dir__,'caps', 'android_appium.txt')
  Appium::Driver.new(caps, true)
  Appium.promote_appium_methods Object

  @driver.start_driver
  @driver.set_wait(DEFAULT_HOLD)
end

AfterStep('@screenshot') do |scenario|
  binary_shot = driver.screenshot_as(:base64)
  temp_shot = 'output/temp_shot.png'

  File.open(temp_shot, 'wb') do |f|
    f.write(Base64.decode64(binary_shot).force_encoding('UTF-8'))
  end

  Allure.add_attachment(
    name: 'screenshot',
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot)
  )
end

After do
  driver.driver_quit
end
