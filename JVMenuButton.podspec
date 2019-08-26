#
# Be sure to run `pod lib lint JVMenuButton.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JVMenuButton"
  s.version          = "1.0"
  s.summary          = "Cool animated hamburger menu button in Objective-C."
  s.description      = "Cool animated hamburger menu button created natively in Objective-C."
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/JVMenuButton"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jorge Valbuena" => "jorgevalbuena2@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/JVMenuButton.git", :tag => s.version.to_s }
  s.platform     = :ios, '11.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
end
