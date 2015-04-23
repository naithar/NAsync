#
# Be sure to run `pod lib lint NAsync.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NAsync"
  s.version          = "0.2.0"
  s.summary          = "Yet another async task library. Promises, chaining etc."
  s.description      = <<-DESC
                       Async task library for both ObjC and Swift. Chaining operations, promises, return values.
                       DESC
  s.homepage         = "https://github.com/naithar/NAsync"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Naithar" => "devias.naith@gmail.com" }
  s.source           = { :git => "https://github.com/naithar/NAsync.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'NAsync' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.weak_framework = 'XCTest'
  s.framework = 'XCTest'

  # s.dependency 'AFNetworking', '~> 2.3'
end
