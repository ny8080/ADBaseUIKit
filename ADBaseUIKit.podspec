

Pod::Spec.new do |s|
  s.name             = 'ADBaseUIKit'
  s.version          = '0.0.1'
  s.summary          = 'A short description of ADBaseUIKit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ny8080/ADBaseUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ny8080' => 'hongsang@2dfire.com' }
  s.source           = { :git => 'https://github.com/ny8080/ADBaseUIKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ADBaseUIKit/Classes/**/*.{h,m}'
  s.public_header_files = 'ADBaseUIKit/Classes/**/*.h'

  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry'
end
