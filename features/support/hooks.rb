Before do
  driver.start_driver
  driver.set_wait(DEFAULT_HOLD)
end

After do
  driver.driver_quit
end

After do
  shot = screenshot('output/temp_evidence.png')

  Allure.add_attachment(
    name: 'Screenshot',
    type: Allure::ContentType::PNG,
    source: File.open(shot)
  )
end
