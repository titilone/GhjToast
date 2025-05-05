# Uncomment the next line to define a global platform for your project
 platform :ios, '15.0'

target 'GhjToast' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  # Pods for GhjToast
  # pod 'GDPerformanceView-Swift'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "HandyJSON"
        target.build_configurations.each do |config|
          config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '0'
          config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
        end
    end
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end
