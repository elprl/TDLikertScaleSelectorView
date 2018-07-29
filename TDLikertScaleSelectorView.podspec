Pod::Spec.new do |s|

  s.name          = "TDLikertScaleSelectorView"
  s.version       = "1.0.5"
  s.summary       = "Likert Scale Question iOS UI"
  s.description   = "This library provides a UI Control for displaying a Likert Scale question"

  s.homepage      = "https://github.com/elprl/TDLikertScaleSelectorView"
  s.screenshots   = "https://github.com/elprl/TDLikertScaleSelectorView/raw/master/screenshot.png"
  s.license       = { :type => "MIT" }
  s.author    	  = "Paul Leo"

  s.platform      = :ios, "11.0"
  s.source        = { :git => "https://github.com/elprl/TDLikertScaleSelectorView.git", :tag => "#{s.version}" }

  s.module_name   = "TDLikertScaleSelectorView"
  s.swift_version = "4.2"
  s.source_files  = "TDLikertScaleSelectorView/Source/*.swift"
  s.framework     = "UIKit"
  s.requires_arc  = true

end
