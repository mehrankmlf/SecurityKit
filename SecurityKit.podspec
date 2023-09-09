Pod::Spec.new do |spec|

  spec.name         = "SecurityKit"
  spec.version      = "1.0.3"
  spec.summary      = "SecurityKit is a security framework for iOS."
  # spec.description  = "SecurityKit is a security framework for iOS."

  spec.homepage     = "https://github.com/mehrankmlf/SecurityKit"

  spec.license      = "MIT"


  spec.author             = { "Mehran Kamalifard" => "mehran.kmlf@icloud.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/mehran-kamalifard/"

  spec.platform     = :ios, "12.0"

  spec.source       = { :git => "https://github.com/mehrankmlf/SecurityKit.git", :tag => spec.version.to_s }

  spec.source_files  = "SecurityKit/SecurityKit/*.{h,m,swift}"
  spec.swift_version = "5.0"

end
