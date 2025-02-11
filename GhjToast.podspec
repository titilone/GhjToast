#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint mapbox_maps_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'GhjToast'
  s.version          = '0.0.1'

  s.summary          = 'Toast'
  s.description      = 'ToastToastToastToastToast'
  s.homepage         = 'https://github.com/titilone/GhjToast'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'titilone' => 'huijian0gao@126.com' }
  s.source           = { :git => 'https://github.com/titilone/GhjToast.git', :tag => s.version }
  s.source_files = 'GhjToast/**/*'
  #s.platform = :ios, '12.0'
  s.ios.deployment_target = '12.0'
  s.swift_versions = ['5.0', '5.1', '5.2']
  #s.dependency 'MapboxMaps', '~> 11.9.0'
  #s.dependency 'Turf', '4.0.0'
end
