#
# Be sure to run `pod lib lint XXTools_Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XXTools_Swift'
  s.version          = '0.1.3'
  s.summary          = 'iOS开发常用工具类扩展库，提供UIKit组件扩展和实用工具方法'
  s.description      = <<-DESC
XXTools_Swift是一个专为iOS开发设计的Swift工具库，包含了常用UI组件的扩展方法，
如UIView、UILabel、UIButton、UIColor等的便捷方法，帮助开发者提高开发效率。
该库还包含了Date、String等基础类型的扩展方法，为iOS开发提供更好的开发体验。
                       DESC

  s.homepage         = 'https://github.com/1260269149/XXTools_Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangxu' => '1260269149@qq.com' }
  s.source           = { :git => 'https://github.com/1260269149/XXTools_Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  s.swift_version    = '5.0'
  
  # 配置资源包，包含多语言文件
  s.resource_bundles = {
    'XXTools_Swift' => ['XXTools_Swift/Assets/Localizable/**/*.strings']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'SnapKit', '~> 5.6.0'
   s.dependency 'Localize-Swift', '~> 3.2'
   
   # 定义默认的source_files，包含所有文件
   s.source_files = 'XXTools_Swift/Classes/**/*.{h,m,swift}'
   
   # 定义子模块
   s.subspec 'Extension' do |extension|
     extension.source_files = 'XXTools_Swift/Classes/Extension/**/*.{h,m,swift}'
   end
   
   s.subspec 'Managers' do |managers|
     managers.source_files = 'XXTools_Swift/Classes/Managers/**/*.{h,m,swift}'
   end
   
end
