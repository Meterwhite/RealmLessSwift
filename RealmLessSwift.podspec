Pod::Spec.new do |s|
  s.name         = "RealmLessSwift"
  s.version      = "2.0.0"
  s.summary      = "Realm write extension.Prefect solution to reduce realm (Swift) tedious write commit coding."
  s.homepage     = "https://github.com/Meterwhite/RealmLessSwift"
  s.license      = "MIT"
  s.author       = { "Meterwhite" => "meterwhite@outlook.com" }
  s.source        = { :git => "https://github.com/Meterwhite/RealmLessSwift.git", :tag => s.version.to_s }
  s.source_files  = "RealmLessSwift/*.swift"
  s.requires_arc  = true
  s.swift_version = '4.0'
  s.module_name	  = 'RealmLessSwift'
  
  s.ios.deployment_target     = '8.0'
  s.osx.deployment_target     = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target    = '9.0'
  
  s.dependency "RealmSwift"
end
