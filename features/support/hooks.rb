Before do
  @driver.start_driver
  @driver.set_wait(DEFAULT_HOLD)
  @driver.manage.timeouts.implicit_wait = 15
end

After do |scenario| # rubocop:disable Lint/UnusedBlockArgument
  # binary_shot = driver.screenshot_as(:png)
  shot = @driver.save_screenshot('output/evidence.png')

  # File.open('output/evidence.png', 'wb') do |f|
  #   f.write(Base64.decode64(binary_shot).force_encoding('UTF-8'))
  # end

  Allure.add_attachment(
    name: 'screenshot',
    type: Allure::ContentType::PNG,
    source: File.open(shot)
  )
end

After do
  @driver.driver_quit
end
