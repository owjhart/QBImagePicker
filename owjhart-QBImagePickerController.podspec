Pod::Spec.new do |s|
  s.name             = "QBImagePickerController"
  s.version          = "owjhart-1.0.0"
  s.summary          = "A clone of QBImagePickerController (v3.4.0) with multiple selection support."
  s.homepage         = "https://github.com/questbeat/QBImagePicker"
  s.license          = "MIT"
  s.author           = { "questbeat" => "questbeat@gmail.com" }
  s.source           = { :git => "https://github.com/questbeat/QBImagePicker.git", :tag => s.version.to_s }
  s.social_media_url = ""
  s.source_files     = "QBImagePicker/*.{h,m}"
  s.exclude_files    = "QBImagePicker/QBImagePicker.h"
  s.resource_bundles = { "QBImagePicker" => "QBImagePicker/*.{lproj,storyboard}" }
  s.platform         = :ios, "8.0"
  s.requires_arc     = true
  s.frameworks       = "Photos"
end
