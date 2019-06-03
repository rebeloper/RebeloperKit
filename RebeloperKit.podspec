#
# Be sure to run `pod lib lint RebeloperKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RebeloperKit'
  s.version          = '0.4.12'
  s.summary          = 'RebeloperKit is a set of tools aimed to make your development faster and easier.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'RebeloperKit is a set of tools aimed to make your development faster and easier. It makes iOS development super fast.'
                       DESC

  s.homepage         = 'https://github.com/rebeloper/RebeloperKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rebeloper' => 'therebeloper@gmail.com' }
  s.source           = { :git => 'https://github.com/rebeloper/RebeloperKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://youtube.com/rebeloper'

  s.ios.deployment_target = '12.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "12.0"
  }
  
  # s.resource_bundles = {
  #   'RebeloperKit' => ['RebeloperKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
