Before do
  driver.start_driver
end

After do
  driver.driver_quit
end

Before do
  driver.manage.timeouts.implicit_wait = DEFAULT_HOLD
  output_directory = "output"

  if Dir.exist?(output_directory)
    FileUtils.rm_f(Dir.glob("#{output_directory}/*"))
  else
    Dir.mkdir(output_directory)
  end
end

After do |scenario|
  begin
    binary_shot = driver.screenshot_as(:base64)
    temp_shot_path = "output/#{scenario.name}_evd_#{scenario.failed? ? "error" : "success"}.png"

    File.open(temp_shot_path, "wb") do |f|
      f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
    end
  rescue StandardError => e
    puts "Error: Unable to perform screenshot action! #{e.message}"
  end

  Allure.add_attachment(
    name: temp_shot_path,
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot_path),
    test_case: true
  )
end
