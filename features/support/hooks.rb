Before do
  @driver.start_driver
  @driver.set_wait(DEFAULT_HOLD)
  @driver.manage.timeouts.implicit_wait = 15
end

After do
  binary_shot = @driver.screenshot_as(:base64)
  temp_shot = 'logs/temp_shot.png'

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
