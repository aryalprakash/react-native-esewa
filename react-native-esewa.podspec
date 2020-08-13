require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-esewa"
  s.version      = "1.0.0"
  s.summary      = "React Native wrapper for eSewa"
  s.description  = <<-DESC
                  react-native-esewa
                   DESC
  s.homepage     = "https://github.com/aryalprakash/react-native-esewa.git#readme"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "aryalprakas@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/aryalprakash/react-native-esewa.git", :tag => "master" }
  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "React"

end

  