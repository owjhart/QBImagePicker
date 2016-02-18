Pod::Spec.new do |s|
  s.name             = "owjhart-QBImagePickerController"
  s.version          = "1.0.1"
  s.summary          = "A clone of QBImagePickerController (v3.4.0) with multiple selection support."
  s.homepage         = "https://github.com/owjhart/QBImagePicker"
  s.license          = "MIT"
  s.author           = { "owjhart" => "owenjhart@gmail.com" }
  s.source           = { :git => "https://github.com/owjhart/QBImagePicker.git", :tag => s.version.to_s }
  s.source_files     = "QBImagePicker/*.{h,m}"
  s.resource_bundles = { "QBImagePicker" => "QBImagePicker/*.{lproj,storyboard}" }
  s.platform         = :ios, "8.0"
  s.requires_arc     = true
  s.frameworks       = "Photos"
end
