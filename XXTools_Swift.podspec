#
# Be sure to run `pod lib lint XXTools_Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XXTools_Swift'
  s.version          = '0.1.1'
  s.summary          = 'iOS开发常用工具类扩展库，提供UIKit组件扩展和实用工具方法'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
XXTools_Swift是一个专为iOS开发设计的Swift工具库，包含了常用UI组件的扩展方法，
如UIView、UILabel、UIButton、UIColor等的便捷方法，帮助开发者提高开发效率。
该库还包含了Date、String等基础类型的扩展方法，为iOS开发提供更好的开发体验。
                       DESC

  s.homepage         = 'https://github.com/1260269149/XXTools_Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangxu' => '1260269149@qq.com' }
  s.source           = { :git => 'https://github.com/1260269149/XXTools_Swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'
  s.swift_version    = '5.0'
  s.source_files = 'XXTools_Swift/Classes/**/*'
  
  # 移除resource_bundles配置，因为没有实际的资源文件
  # s.resource_bundles = {
  #   'XXTools_Swift' => ['XXTools_Swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'SnapKit', '~> 5.6.0'
end
