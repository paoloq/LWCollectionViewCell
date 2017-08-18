#
# Be sure to run `pod lib lint LWCollectionViewCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LWCollectionViewCell'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight collection view cell for monstrous scrolling smoothness'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Achieving a perfect smoothness is possible only if CPU and GPU loading is balanced.
LWCollectionViewCell clears the subviews' stack, and keeps one subview only,
the one where we're going to draw most of the content in.
So, force yourself to draw any static image and text using CoreGraphics, but use a
UIImageView if you need an asynchronous image loading.
Avoid gradients, avoid blendings, and keep all pixel-perfect rounding coordinates and dimensions
with ceil and floor, or using the .integral attribute of CGRect.
Have fun!
                       DESC

  s.homepage         = 'https://github.com/paoloq/LWCollectionViewCell'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paolo Arduin' => 'arduin.paolo@gmail.com' }
  s.source           = { :git => 'https://github.com/paoloq/LWCollectionViewCell.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LWCollectionViewCell/Classes/**/*.{swift}'
  
  # s.resource_bundles = {
  #   'LWCollectionViewCell' => ['LWCollectionViewCell/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
