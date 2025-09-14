#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
s.name             = 'vibration_fixed_web'
s.version          = '1.6.9'
s.summary          = 'Web implementation of Vibration Fixed plugin'
s.description      = <<-DESC
Web implementation of Vibration Fixed plugin
                       DESC
s.homepage         = 'https://github.com/boughdiri-dorsaf/vibration_fixed'
s.license          = { :file => '../LICENSE' }
s.author           = { 'Boughdiri Dorsaf' => 'boughdiri.dorsaf@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
