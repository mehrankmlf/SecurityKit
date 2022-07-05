Pod::Spec.new do |spec|

  spec.name         = "SecurityKit"
  spec.version      = "1.0.1"
  spec.summary      = "SecurityKit is a security framework for iOS."
  # spec.description  = "SecurityKit is a security framework for iOS."

  spec.homepage     = "https://github.com/mehrankmlf/SecurityKit"

  spec.license      = "MIT"


  spec.author             = { "Mehran Kamalifard" => "mehran.kmlf@icloud.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/mehran-kamalifard/"

  spec.platform     = :ios, "12.0"

  spec.source       = { :git => "https://github.com/mehrankmlf/SecurityKit.git", :tag => spec.version.to_s }

  spec.source_files  = "SecurityKit/**/*.{swift}"
  spec.swift_version = "5.0"
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
