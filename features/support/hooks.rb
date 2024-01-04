# Before do
#   driver.start_driver
# end

# After do
#   driver.driver_quit
# end

# Before do
#   driver.set_wait(DEFAULT_HOLD)
#   output_directory = "output"

#   if Dir.exist?(output_directory)
#     FileUtils.rm_f(Dir.glob("#{output_directory}/*"))
#   else
#     Dir.mkdir(output_directory)
#   end
# end

# After do
#   begin
#   binary_shot = driver.screenshot_as(:base64)
#   temp_shot = "output/temp_shot.png"

#   File.open(temp_shot, "wb") do |f|
#     f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
#   end

#   rescue => exception
#     puts "Error: Unable to perform screenshot action! #{exception.message}"
#   end

#   Allure.add_attachment(
#     name: "evidence.png",
#     type: Allure::ContentType::PNG,
#     source: File.open(temp_shot),
#     test_case: true
#   )
# end









Before do
  driver.start_driver
end

After do
  driver.driver_quit
end

Before do
  driver.set_wait(DEFAULT_HOLD)
  output_directory = "output"

  if Dir.exist?(output_directory)
    FileUtils.rm_f(Dir.glob("#{output_directory}/*"))
  else
    Dir.mkdir(output_directory)
  end
end

After do
  begin
    @shot = screenshot('output/evidence.png')
  rescue => exception
    puts "Error: Unable to perform screenshot action! #{exception.message}"
  end

  Allure.add_attachment(
    name: 'screenshot',
    type: Allure::ContentType::PNG,
    source: File.open(@shot)
  )
end
