require "httparty"
require "dotenv-vault/load"

desc "Cleaning outputs directory"
task :clean_output do
  output_directory = "output"

  if Dir.exist?(output_directory)
    FileUtils.rm_f(Dir.glob("{output_directory}/*"))
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

task :build_app do
  @url_apk = ENV["BUILD_APP"]

  unless Dir.exist?("app")
    Dir.mkdir("app")

    response = HTTParty.get(@url_apk)
    file_path = File.join(__dir__, "app", "nuclone.apk")

    File.open(file_path, "wb") do |file|
      file.write(response.body)
    end
  end
end

namespace :tools do
  task :run_appium do
    sh "cucumber tools=ap"
  end

  task :run_bs do
    sh "cucumber tools=bs"
  end
end
