Before do
  driver.start_driver
end

After do
  driver.driver_quit
end

Before do
  driver.set_wait(DEFAULT_HOLD)
  if Dir.exist?('output')
    FileUtils.rm_f(Dir.glob('output/*'))
  else
    Dir.mkdir 'output'
  end
end

After do
  begin
  binary_shot = driver.screenshot_as(:base64)
  temp_shot = 'output/temp_shot.png'

  File.open(temp_shot, "wb") do |f|
    f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
  end

  rescue => exception
    puts "Error: Unable to perform screenshot action! #{exception.message}"
  end

  Allure.add_attachment(
    name: 'evidence.png',
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
    test_case: true
  )
end
