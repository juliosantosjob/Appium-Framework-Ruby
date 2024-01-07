desc "Cleaning outputs directory"
task :clean_output do
  output_directory = "output"

  if Dir.exist?(output_directory)
    FileUtils.rm_f(Dir.glob("#{output_directory}/*"))
  else
    Dir.mkdir(output_directory)
  end
end

task :allure_history do
  unless Dir.exist?("output/allure-reports")
    sh "allure generate --output output/allure-reports" \
    " && (move output/allure-reports/history output/history)"
  end
end
