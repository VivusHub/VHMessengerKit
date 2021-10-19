#
# Be sure to run `pod lib lint VHMessengerKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VHMessengerKit'
  s.version          = '1.0.1'
  s.summary          = 'A UI framework for building messenger interfaces on iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This an updated version of VHMessengerKit, a drop-in UI for messenger interfaces on iOS built in Swift. Centred around a single UIViewController, VHMessengerKit is themeable to fit your needs and includes a number of powerful features:

 - UICollectionView based with pre-loading and caching of size calculation for bubbles.
 - Auto-growing input view.
 - Multiple cell types: text, large-emoji, image, video, location and gifs.
 - Presentation of SFSafariViewController
 - Built-in, customisable themes.
 - A custom theming system to bring your own UICollectionViewCells, headers, footers, and input views.
 - Avatar support (currently only in the travamigos theme).

The framework is actively being used and maintained in one of our apps, [Vivus](https://www.vivushub.com/vivus/?ref=github).
                       DESC

  s.homepage         = 'https://github.com/VivusHub/VHMessengerKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'VivusHub' => 'dev@vivushub.com' }
  s.source           = { :git => 'https://github.com/VivusHub/VHMessengerKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/VivusHub'

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.dependency 'SDWebImageFLPlugin'
  s.source_files = ['VHMessengerKit/**/*.{h,m,swift}']
  s.resources = 'VHMessengerKit/**/*.{xcassets,xib,nib}'

end
