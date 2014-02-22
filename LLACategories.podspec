Pod::Spec.new do |spec|
  spec.name = 'LLACategories'
  spec.version = '0.1.0'
  spec.authors = { 'Lukas Lipka' => 'lukaslipka@gmail.com' }
  spec.homepage = 'https://github.com/lipka/LLACategories'
  spec.summary = 'A collection of categories for UIKit and Foundation classes.'
  spec.source = { :git => 'https://github.com/lipka/LLACategories.git', :tag => "v#{spec.version}" }
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.requires_arc = true
  spec.ios.frameworks = 'UIKit', 'CoreGraphics', 'QuartzCore'
  spec.ios.source_files = 'LLACategories/*.{h,m}'
end
