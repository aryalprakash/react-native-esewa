
Pod::Spec.new do |s|
  s.name         = "RNEsewa"
  s.version      = "1.0.0"
  s.summary      = "RNEsewa"
  s.description  = <<-DESC
                  RNEsewa
                   DESC
  s.homepage     = "https://github.com/author/RNEsewa.git#readme"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNEsewa.git", :tag => "master" }
  s.source_files  = "RNEsewa/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  