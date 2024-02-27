#
# Be sure to run `pod lib lint XCToolbox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XCToolbox'
  s.version          = '0.2.1'
  s.summary          = 'Tools for XCUITest.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A collection of tools to enhance and improve your testing experience with XCUITest.
                       DESC

  s.homepage         = 'https://github.com/iammike'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mike Collins' => 'mike@iammike.org' }
  s.source           = { :git => 'https://github.com/iammike/XCToolbox.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_versions = '4.0'

  s.source_files = 'XCToolbox/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XCToolbox' => ['XCToolbox/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'XCTest'
  # s.dependency 'AFNetworking', '~> 2.3'
end
