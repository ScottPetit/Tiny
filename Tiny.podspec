Pod::Spec.new do |spec|
  spec.name = 'Tiny'
  spec.version = '1.0.1'
  spec.authors = {'Scott Petit' => 'petit.scott@gmail.com'}
  spec.homepage = 'https://github.com/ScottPetit/Tiny'
  spec.summary = 'An extensible wrapper around URL Shorteners'
  spec.source = {:git => 'https://github.com/ScottPetit/Tiny.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.platform = :ios, '6.0'
  spec.requires_arc = true
  spec.frameworks = 'Foundation'
  spec.dependency 'CMDQueryStringSerialization', '~> 0.2'
  spec.source_files = 'Tiny/*.{h,m}', 'Tiny/NTAURLShortenerService/*.{h,m}'
end
