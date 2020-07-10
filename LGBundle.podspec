#
# Be sure to run `pod lib lint LGBundle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LGBundle'
  s.version          = '1.0.2'
  s.summary          = 'A short description of LGBundle.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LYajun/LGBundle'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LYajun' => 'liuyajun1999@icloud.com' }
  s.source           = { :git => 'https://github.com/LYajun/LGBundle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.subspec 'Manager' do |manager|
    manager.source_files = 'LGBundle/Classes/Manager/*{h,m}'
  end

  s.subspec 'LGBundle' do |bundle|
    bundle.dependency 'LGBundle/Manager'
    bundle.resources = 'LGBundle/Classes/LGBundle/LGBundle.bundle'
  end

  s.subspec 'LGBarBundle' do |barbundle|
    barbundle.dependency 'LGBundle/Manager'
    barbundle.resources = 'LGBundle/Classes/LGBarBundle/LGBarBundle.bundle'
  end

  
end
