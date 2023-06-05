#
# Be sure to run `pod lib lint LGBundle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LGBundle'
  s.version          = '1.0.5'
  s.summary          = 'A short description of LGBundle.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://gitee.com/yjhome/lgbundle'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LYajun' => 'liuyajun1999@icloud.com' }
  s.source           = { :git => 'https://gitee.com/yjhome/lgbundle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.subspec 'Bundle' do |bundle|
    bundle.source_files = 'LGBundle/Classes/Bundle/*{h,m}'
    bundle.resources = 'LGBundle/Classes/Bundle/Bundle.bundle'
  end

  s.subspec 'BarBundle' do |barbundle|
    barbundle.dependency 'LGBundle/Manager'
    barbundle.resources = 'LGBundle/Classes/BarBundle/BarBundle.bundle'
  end

  
end
