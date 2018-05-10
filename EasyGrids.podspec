Pod::Spec.new do |s|
  s.name         = "EasyGrids"
  s.version      = "1.0.0"
  s.summary      = "EasyGrids is a control to create photo collections and grids easy"
  s.homepage     = "https://www.facebook.com/shoaib.ahmed.923"
  s.license      = "MIT"
  s.author       = {"Shoaib Ahmed Qureshi" => "shoaib.elastica@gmail.com" }
  s.source       = {:git => "https://github.com/shoaibahmedqureshi/EasyGrids.git",:tag => "1.0.0"}
  s.requires_arc = true
  s.ios.deployment_target = "10.0"
  s.public_header_files = "**/*.h"
  s.private_header_files = "**/*.h"
  s.source_files  = "**/*.{h,m,xib}"
  s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PLATFORM_DIR)/Developer/Library/Frameworks" }
end