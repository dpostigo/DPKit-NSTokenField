Pod::Spec.new do |s|
  s.name         = "DPKit-NSTokenField"
  s.version      = "0.0.1"
  s.summary      = "DPKit-NSTokenField"
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }


  s.source       = { :git => "https://github.com/dpostigo/DPKit-NSTokenField.git", :tag => s.version.to_s }
  s.platform     = :osx, '10.8'


  s.dependency     'DPKit-Styles'
  s.dependency     'DPKit-NSCell'
  s.frameworks   = 'Foundation', 'QuartzCore'
  s.requires_arc = true

  s.source_files = 'DPKit-NSTokenField/*.{h,m}'



  
end
