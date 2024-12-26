platform :ios, '15.6'
inhibit_all_warnings!
install! 'cocoapods', :deterministic_uuids => false
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'App' do
  pod 'SuperView/Core', :path => 'SuperView.podspec'
  pod 'SuperView/OneSignal', :path => 'SuperView.podspec'
  pod 'SuperView/AdMob', :path => 'SuperView.podspec'
  pod 'SuperView/Firebase', :path => 'SuperView.podspec'
  pod 'SuperView/QR', :path => 'SuperView.podspec'
  pod 'SuperView/Location', :path => 'SuperView.podspec'
  pod 'SuperView/CardScan', :path => 'SuperView.podspec'
end

target 'NotificationService' do
  pod 'OneSignal/OneSignal'
end
