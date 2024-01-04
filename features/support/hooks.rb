Before do
  driver.start_driver
end

After do
  driver.driver_quit
end

Before do
  driver.set_wait(DEFAULT_HOLD)
  FileUtils.rm_f(Dir.glob('output/*'))
end

After do
  begin
    shot = screenshot('output/temp_evidence.png')
  rescue => exception
    puts 'Error: Unable to perform screenshot action!'
  end

  Allure.add_attachment(
    name: 'screenshot',
    type: Allure::ContentType::PNG,
    source: File.open(shot)
  )
end
