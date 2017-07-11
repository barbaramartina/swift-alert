
Pod::Spec.new do |s|
  s.name             = 'Alert'
  s.version          = '0.1.0'
  s.summary          = 'A simple and versatile view to present quick messages, written in Swift.'

  s.description      = <<-DESC
  A simple alert pod to present quick, auto dismissed messages to the user.
  Allows you to customise background, borders, colors, font families and sizes, messages,
  icons, displaying times.
  Offers a convenient set of default icons and presentations.
                      DESC

  s.homepage         = 'https://github.com/barbaramartina/swift-alert'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'GNU General Public License v3.0', :file => 'LICENSE' }
  s.author           = { 'git' => 'barbararodeker@gmail.com' }
  s.source           = { :git => '', :tag => s.version.to_s }
  s.social_media_url   = "https://github.com/barbaramartina"

  s.ios.deployment_target = '10.0'

  s.source_files = 'Alert/Classes/**/*'

  s.resource_bundles = {
     'Alert' => ['Alert/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png}']
   }

  s.frameworks = 'UIKit'

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
